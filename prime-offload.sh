#!/bin/sh

if ! lsmod | grep nvidia > /dev/null; then
	echo "No nvidia loaded, exiting"
	exit 0
fi

output="$(xrandr --listproviders)"
src=$(echo "$output" | grep " Source" | head -n1 | awk '{print $NF}' | cut -d: -f2)
sink=$(echo "$output" | grep " Sink" | head -n1 | awk '{print $NF}' | cut -d: -f2)

echo "Using source ${src}, sink ${sink}"
xrandr --setprovideroutputsource "$sink" "$src"
xrandr --auto
