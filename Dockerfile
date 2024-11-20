# Base image
FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Install Studio CLI
RUN INST_URL=https://distro.windriver.com/dist/wrstudio/wrstudio-cli-distro-cd/install-studio-cli.sh && curl -f $INST_URL --output inst.sh && bash inst.sh -u $INST_URL -y

# Use environment variables for secrets at runtime
ENTRYPOINT ["/entrypoint.sh"]
