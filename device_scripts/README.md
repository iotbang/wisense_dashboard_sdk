# device.sh
Use to simulate a WXI-RH/T-10 device via HTTP telemetry api.
Requirements: gnu-coreutils installed (Default available in git-bash and ubuntu)
<pre><b>Usage: ./device.sh access_token sending_interval(in seconds)</b></pre>

# mqtt.sh
Use to simulate a WXI-RH/T-10 device via MQTT telemetry api.
Prerequisite: mosquitto servive  istalled on the machine.
<pre><b>Usage: ./mqtt.sh access_token sending_interval(in seconds)</b></pre>

# update_gps.sh
Use to update GPS coordinates on the device dashboard map.
Requirement: Nothing
<pre><b>Usage: ./update_gps access_token latitude longitude</b></pre>