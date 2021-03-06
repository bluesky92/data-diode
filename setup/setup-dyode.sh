#!/usr/bin/env sh

apt-get install -y inotify-tools python-pyinotify python-pymodbus python-async python-yaml
# TODO: add udpcast install setup (package or source)

mkdir /opt/dyode

cd ../dyode-half-fiber/

cp config.yaml dyode.py dyode_in.py dyode_out.py screen.py modbus.py /opt/dyode/
grep dyode_out -A2 config.yaml | tail -2 | sed 's/ //g; s/ip:/OUT_IP=/;s/mac:/OUT_MAC=/' > /opt/dyode/env

chown $user:$user -R /opt/diode

cp dyode-in.service dyode-out.service /lib/systemd/system/
systemctl daemon-reload

cd -
