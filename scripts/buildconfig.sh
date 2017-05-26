#!/bin/bash
gem install pleaserun
sudo cp build/* /usr/local/bin/.
pleaserun --overwrite --install-prefix `pwd`/scripts/config/sysv -p sysv /usr/local/bin/polymur-proxy
pleaserun --overwrite --install-prefix `pwd`/scripts/config/upstart -p upstart /usr/local/bin/polymur-proxy
pleaserun --overwrite --install-prefix `pwd`/scripts/config/systemd -p systemd /usr/local/bin/polymur-proxy

pleaserun --overwrite --install-prefix `pwd`/scripts/config/sysv -p sysv /usr/local/bin/polymur-gateway
pleaserun --overwrite --install-prefix `pwd`/scripts/config/upstart -p upstart /usr/local/bin/polymur-gateway
pleaserun --overwrite --install-prefix `pwd`/scripts/config/systemd -p systemd /usr/local/bin/polymur-gateway

pleaserun --overwrite --install-prefix `pwd`/scripts/config/sysv -p sysv /usr/local/bin/polymur
pleaserun --overwrite --install-prefix `pwd`/scripts/config/upstart -p upstart /usr/local/bin/polymur
pleaserun --overwrite --install-prefix `pwd`/scripts/config/systemd -p systemd /usr/local/bin/polymur
