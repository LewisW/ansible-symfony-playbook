FROM lewisw/docker-test-runner
MAINTAINER Lewis Wright <lewis@allwrightythen.com>

# Create the structure
WORKDIR /project

# Copy the role requirements and run them
COPY install-dependencies.sh ansible/install-dependencies.sh
COPY requirements.txt ansible/requirements.txt
RUN /ansible_dependencies

# Copy any files used in provisioning & provision
COPY . ansible/
RUN /apt_cacher leeroy.vivait.co.uk; /ansible_setup && /graceful_shutdown
