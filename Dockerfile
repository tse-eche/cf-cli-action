FROM ubuntu:mantic-20231011

# Update and install necessary packages
RUN apt-get update && apt-get install -y ca-certificates jq wget gnupg

# Add Cloud Foundry CLI v8 repository and key
RUN wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add -
RUN echo "deb https://packages.cloudfoundry.org/debian stable main" > /etc/apt/sources.list.d/cloudfoundry-cli.list

# Update package list
RUN apt-get update && apt-get install -y cf8-cli  # install the latest v8 version

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
