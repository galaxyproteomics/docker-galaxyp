# Galaxy - GalaxyP
#
# VERSION       0.1

FROM quay.io/bgruening/galaxy:17.01

MAINTAINER Björn A. Grüning, bjoern.gruening@gmail.com

ENV GALAXY_CONFIG_BRAND Galaxy for Proteomic Research

# Install tools
ADD galaxyp.yaml $GALAXY_ROOT/tools.yaml
ADD galaxyp_wf.yaml $GALAXY_ROOT/workflows.yaml

RUN install-tools $GALAXY_ROOT/workflows.yaml && \
    install-tools $GALAXY_ROOT/tools.yaml

# Data libraries
ADD library_data.yaml $GALAXY_ROOT/library_data.yaml

# Download training data and populate the data library
RUN startup_lite && \
    sleep 60 && \
    . $GALAXY_VIRTUAL_ENV/bin/activate && \
    python /usr/local/lib/python2.7/dist-packages/ephemeris/setup_data_libraries.py -i $GALAXY_ROOT/library_data.yaml && \
    workflow-install --workflow_path $GALAXY_HOME/workflows/ -g http://localhost:8080 -u $GALAXY_DEFAULT_ADMIN_USER -p $GALAXY_DEFAULT_ADMIN_PASSWORD
