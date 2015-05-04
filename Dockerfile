FROM lewisw/docker-test-runner
MAINTAINER Lewis Wright <lewis@allwrightythen.com>

# Create the structure
WORKDIR /project

# Use Leeroy as an apt-cache
RUN echo 'Acquire::http { Proxy "http://leeroy.vivait.co.uk:3142"; };' >> /etc/apt/apt.conf.d/00proxy \
    && apt-get update

COPY github-oauth.token github-oauth.token
RUN /composer_oauth github-oauth.token

# Copy the role requirements and run them
COPY ansible/install-dependencies.sh ansible/install-dependencies.sh
COPY ansible/requirements.txt ansible/requirements.txt
RUN /ansible_dependencies

# Copy any files used in provisioning & provision
COPY ansible ansible
COPY app/config/parameters.yml.dist app/config/parameters.yml.dist
RUN /ansible_setup && /graceful_shutdown

# Copy any composer files and pre-download them
COPY composer.* ./
RUN /composer_setup

# Try and provision, so we can atleast cache
COPY ./ ./
RUN /ansible_update && /graceful_shutdown
