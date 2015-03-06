FROM lewisw/jenkins-slave
MAINTAINER Lewis Wright <lewis@allwrightythen.com>

# Create the structure
WORKDIR /project

# Copy the role requirements and run them
COPY ansible/install-dependencies.sh ansible/install-dependencies.sh
COPY ansible/requirements.txt ansible/requirements.txt
RUN /ansible_dependencies

# Copy any files used in provisioning & provision
COPY ansible ansible
COPY app/config/parameters.yml.dist app/config/parameters.yml.dist
RUN /ansible_setup && /graceful_shutdown
#
# Copy any composer files and pre-download them
COPY composer.* ./
RUN /composer_setup

# Try and provision, so we can atleast cache
COPY ./ ./
RUN /ansible_update && /graceful_shutdown

ENTRYPOINT ["/sbin/my_init"]
