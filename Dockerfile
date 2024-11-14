FROM ubuntu:mantic-20231011

RUN apt-get update
RUN apt-get install -y ca-certificates jq wget

# Add the Cloud Foundry CLI v8 repository and key
RUN wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add -
RUN echo "deb [trusted=yes] https://packages.cloudfoundry.org/debian /" > /etc/apt/sources.list.d/cloudfoundry-cli.list

RUN apt-get update
RUN apt-get install -y cf8-cli  # Change to 'cf8-cli' to install the latest v8 version

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
