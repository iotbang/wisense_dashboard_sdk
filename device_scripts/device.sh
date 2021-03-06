#!/bin/bash

# stdout color profiles.
WARN='\033[0;31m'
NC='\033[0m'
OK='\033[0;32m'
YEL='\033[1;33m'

# Usage prompt and user input.
read -p "$(echo -e "\n${YEL}Verify format:${NC} ./update_gps.sh ACCESS_TOKEN SENDING_INTERVAL : (--v for verbose)\nContinue? (y/N) : ")" -r input

case $input in
[yY])
    echo -e ">>\n\n${OK}Starting to send every "$2"secs...\nDevice details from device.json\n${NC}"
    while true
    do
        # Generating random float values in sensor value range.
        vcc=$(seq 2.8 0.01 3 | shuf | head -n1)
        chipTemp=$(seq 28 0.15 30 | shuf | head -n1)
        b2=$(seq 65 0.15 67 | shuf | head -n1)
        b3=$(seq 26 0.03 28 | shuf | head -n1)

        # Writing values to device.json file.
        customtab='    '
        sed -i "4s/.*/${customtab}\"0x78\":${vcc},/; 5s/.*/${customtab}\"0x79\":${chipTemp},/; 6s/.*/${customtab}\"0xb2\":${b2},/; 7s/.*/${customtab}\"0xb3\":${b3}/" device.json

        # Making curl command and POST body. 
        cmdpart1="curl -s -H \"Accept: application/json\" -H \"Content-type: application/json\" POST -d "
        cmdpart2="@device.json "
        cmdpart3="https://dashboard.wisense.in/api/v1/"$1"/telemetry"
        cmd="$cmdpart1""$cmdpart2""$cmdpart3"

        # Request goes here.
        eval $cmd

        # Verbose of POST data.
        echo ">> Sent."
        case $3 in
        --v)
            sed -n 2,7p device.json ;;
        esac

        # Sending interval.
        sleep $2
    done
    ;;
*)
    echo -e "\n${WARN}Exited.${NC}"
    ;;
esac