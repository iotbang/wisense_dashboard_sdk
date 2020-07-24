#!/bin/bash

WARN='\033[1;31m'
NC='\033[0m'
OK='\033[0;32m' 
YEL='\033[1;33m'

#echo -e "${YEL}Verify format:${NC} ./update_gps.sh ACCESS_TOKEN LATITUDE LONGITUDE\nContinue.?(y/N) - " && read input
read -p "$(echo -e "\n${YEL}Verify format:${NC} ./update_gps.sh ACCESS_TOKEN LATITUDE LONGITUDE\nContinue? (y/N) : ")" -r input

case $input in
[yY])
    echo -e ">>\n\n${OK}Sharing device GPS coordinates...${NC}"
    # A backward slash(\) is not required for escaping single quotes in strings. 
    cmdpart1="curl -o /dev/null -s -w \"%{http_code}\" -H \"Accept: application/json\" -H \"Content-type: application/json\" POST -d "
    cmdpart2="'{\"latitude\":$2, \"longitude\":$3}' "
    cmdpart3="https://dashboard.wisense.in/api/v1/"$1"/telemetry"
    cmd="$cmdpart1""$cmdpart2""$cmdpart3"
    #echo -e "Sent: "$cmdpart2"\n"
    echo -e "Sent- latitude: ${2}, longitude: ${3}\n"
    echo "Evaluating response from server..."
    responseCode=$(eval $cmd)
    if [ $responseCode -eq 200 ] ; then
        echo -e "${OK}COORDINATES UPDATE SUCCESS.${NC}"
    elif [ $responseCode -eq 400 ] ; then
        echo -e "${WARN}Bad request - HTTP - 400${NC} - Review your request!"
    elif [ $responseCode -eq 401 ] ; then
        echo -e "${WARN}Unauthorised: Invalid access token!${NC} - Review credentials!"
    elif [ $responseCode -eq 404 ] ; then
        echo -e "${WARN}Resource not found - 404${NC} - Review your request!"
    else 
        echo -e "${WARN}Unknown error - HTTP - ${responseCode}${NC} - Review request!"
    fi
    ;;
*)
    echo -e ">>\n${WARN}Bye.${NC}"
    ;;
esac