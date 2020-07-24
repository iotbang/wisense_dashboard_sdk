#!/bin/bash

#Install mosquitto before running. Refer .txt file.

WARN='\033[0;31m'
NC='\033[0m'
OK='\033[0;32m'
YEL='\033[1;33m'

latencyoff=0.2

#echo -e "Verify format: ./mqtt.sh ACCESS_TOKEN SENDING_INTERVAL\nContinue.?(Y/N)"  && read input
read -p "$(echo -e "\n${YEL}Verify format:${NC} ./update_gps.sh ACCESS_TOKEN SENDING_INTERVAL\nContinue? (y/N) : ")" -r input

case $input in
[yY])
    echo -e ">>\n\n${OK}Starting to send every "$2"secs...\n${NC}"
    while true
    do
        vcc=$(seq 2.8 0.01 3 | shuf | head -n1)
        chipTemp=$(seq 28 0.15 30 | shuf | head -n1)
        b2=$(seq 65 0.15 67 | shuf | head -n1)
        b3=$(seq 26 0.03 28 | shuf | head -n1)
        # A backward slash(\) is not required for escaping single quotes in strings. 
        cmdpart1="mosquitto_pub -h \"dashboard.wisense.in\" -t \"v1/devices/me/telemetry\" -u "$1" -m "
        cmdpart2="'{\"Name\":\"WSN-0010efd2\", \"MacId\":\"00:10:ef:d2\", \"0x78\":$vcc, \"0xb2\":$b2, \"0xb3\":$b3, \"0x79\":$chipTemp}'"
        #cmdpart2="'{\"latitude\":12.9777156 , \"longitude\":77.6375863}'"
        cmd="$cmdpart1""$cmdpart2"
        echo "Sent: "$cmdpart2
        eval $cmd
        #Correcting 200 to 100ms as internet lattency offset.
        sleep $(bc <<< "scale=2;$2-$latencyoff")
    done
    ;;
*)
    echo -e ">>\n${WARN}Bye!${NC}"
    ;;
esac

