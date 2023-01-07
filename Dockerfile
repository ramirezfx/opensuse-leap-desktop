ARG VER=latest
FROM opensuse/leap:$VER
ENV SHELL=/bin/bash

RUN zypper -n in -t pattern apparmor base enhanced_base kde kde_plasma minimal_base multimedia office sw_management x11 yast2_basis

RUN zypper -n in git cups wget

# Download and install latest Nomachine
RUN wget -O /tmp/nomachine.rpm "https://download.nomachine.com/download/8.2/Linux/nomachine_8.2.3_4_x86_64.rpm" && zypper -n --no-gpg-checks in /tmp/nomachine.rpm

# ADD nxserver.sh
RUN wget -O /nxserver.sh https://raw.githubusercontent.com/ramirezfx/opensuse-leap-desktop/main/nxserver.sh && chmod +x /nxserver.sh

ENTRYPOINT ["/nxserver.sh"]
