#!/bin/bash

network="$1"

data=$(nmcli | grep " connected" | wc -l)

if [[ "$data" = "0" ]]; then
    echo "%{F#71C3F7}󰣽 %{F#71C3F7}Offline"
else
    net=$(nmcli | grep " connected" | head -n 1 | awk '{print $4}')
    echo "%{F#71C3F7}󰣾  %{F#71C3F7}$net"
fi
