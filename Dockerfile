ARG VER=15.4
FROM ramirezfx/opensuse-iso:$VER
ENV SHELL=/bin/bash

RUN zypper -n in git cups wget

# Download and install latest Nomachine
RUN wget -O /tmp/nomachine.rpm "https://download.nomachine.com/download/8.2/Linux/nomachine_8.2.3_4_x86_64.rpm" && zypper -n --no-gpg-checks in /tmp/nomachine.rpm

# ADD nxserver.sh
RUN wget -O /nxserver.sh https://raw.githubusercontent.com/ramirezfx/opensuse-leap-desktop/main/nxserver.sh && chmod +x /nxserver.sh

ENTRYPOINT ["/nxserver.sh"]
