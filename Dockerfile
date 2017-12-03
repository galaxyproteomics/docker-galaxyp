# Galaxy - GalaxyP

FROM bgruening/galaxy-sequence-tools:17.09

MAINTAINER Björn A. Grüning, bjoern.gruening@gmail.com

ENV GALAXY_CONFIG_BRAND Galaxy for Proteomic Research

# Install tools
ADD galaxyp.yaml $GALAXY_ROOT/tools.yaml

RUN install-tools $GALAXY_ROOT/tools.yaml && \
    /tool_deps/_conda/bin/conda clean --tarballs
