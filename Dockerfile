# Container image that runs your code
FROM ubuntu:latest

ENV PATH="$PATH:/root/bin"
RUN apt-get update
RUN apt-get install -y  ca-certificates curl gnupg

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

RUN INST_URL=https://distro.windriver.com/dist/wrstudio/wrstudio-cli-distro-cd/install-studio-cli.sh && curl -f $INST_URL --output inst.sh && bash inst.sh -u $INST_URL -y
RUN complete -C studio-cli studio-cli

RUN studio-cli --version

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]

