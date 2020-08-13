Important: Device name and Mac ID should be changed/reviewed in [device.json](https://github.com/iotbang/wisense_dashboard_sdk/blob/master/device_scripts/device.json) before running scripts. 

Device JSON first two key-value should be 'Name and 'MacId', the rest can be inititated to random values without any order of preference. Sensor values will be dynamically written to the JSON file before sending.

# device.sh
Use to simulate a WXI-RH/T-10 device via HTTP telemetry api.
Requirements: gnu-coreutils installed (Default available in git-bash and ubuntu)
<pre>
<b>Usage:</b> $ ./device.sh access_token sending_interval(in seconds)

<b>To run silent in background:</b> 
$ ./device.sh access_token sending_interval > /dev/null 2>&1
  >> Input "y" and press enter.
  >> Hit Ctrl+Z
$ bg
$ disown
</pre>

# mqtt.sh
Use to simulate a WXI-RH/T-10 device via MQTT telemetry api.
Prerequisite: mosquitto mqtt service installed on the machine.<br>
[Follow help](https://github.com/iotbang/wisense_dashboard_sdk/blob/master/device_scripts/install_mosquitto_mqtt_linux.txt)
<pre><b>Usage:</b> $ ./mqtt.sh access_token sending_interval(in seconds)</pre>

# update_gps.sh
Use to update GPS coordinates on the device dashboard map.
Requirement: No special requ irements.
<pre><b>Usage:</b> $ ./update_gps access_token latitude longitude</pre><br>

For more, refer [Dashboard_AdminDoc.pdf](https://github.com/iotbang/wisense_dashboard_sdk/blob/master/Dashboard_AdminDoc.pdf).
