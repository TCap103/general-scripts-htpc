#!/bin/bash

function die {
    echo "ERROR: $1"
    exit 1
}

PACKAGES_TO_INSTALL=( vim-gnome openssh-server openssh-client apache2 ) # mysql-client-core-5.5 php5-fpm )
for package in "${PACKAGES_TO_INSTALL[@]}"; do
    [ ! -z "$(dpkg -l | grep "$package")" ] || echo "Installing $package..." || sudo apt-get install -y "$package" &> /dev/null || die "unable to install $package"
done

RESTART_APACHE=false

PORTS_FILE=/etc/apache2/ports.conf
LAN_IP="$(ifconfig | grep -A1 eth0 | grep inet | cut -d ':' -f2 | cut -d ' ' -f1)"

if [ -z "$(grep "$LAN_IP" "$PORTS_FILE")" ]; then 
    RESTART_APACHE=true
    sudo sed -i "s/Listen 80/Listen "$LAN_IP":80/" "$PORTS_FILE"
fi

if "$RESTART_APACHE"; then
    echo "Restarting apache..."
    sudo service apache2 restart &> /dev/null
fi
