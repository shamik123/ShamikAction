# Container image that runs your code
FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y  ca-certificates curl gnupg

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh
RUN PATH=$PATH:/root/bin
RUN INST_URL=https://distro.windriver.com/dist/wrstudio/wrstudio-cli-distro-cd/install-studio-cli.sh && curl -f $INST_URL --output inst.sh && bash inst.sh -u $INST_URL -y

RUN studio-cli --version

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]

