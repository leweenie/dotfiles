#!/usr/bin/env bash

echo -e '802-11-wireless\nset 802-1x.phase2-auth mschapv2\nset 802-1x.identity tleween\nquit\nyes' | nmcli connection edit
