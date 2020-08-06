# WiSense Dashboard SDK 
(https://dashboard.wisense.in)

# I. Device scripts: 
Use these scripts to simulate devices for demo or testing required at different stages of deployment.<br> 
As of now scripts directly simulate "WXI-RH/T-10" device. Device name and MacId can be changed in [device.json](https://github.com/iotbang/wisense_dashboard_sdk/blob/master/device_scripts/device.json).<br>
Refer the [README](https://github.com/iotbang/wisense_dashboard_sdk/blob/master/device_scripts/README.md) included in the [device scripts](https://github.com/iotbang/wisense_dashboard_sdk/tree/master/device_scripts) directory.


# II. Rule scripts: 
These are the important custom scripts used inside the rule-chain nodes.
These scripts are implemented in [create_and_clear_alarms.json](https://github.com/iotbang/wisense_dashboard_sdk/blob/master/create___clear_alarms.json) rule-chain.<br>
In order to alerts and alarm feature work - this rule-chain should be made as root.

# III. Dashboard JSON files:
<b>1. [yoursampledashboard.json](https://github.com/iotbang/wisense_dashboard_sdk/blob/master/yoursampledashboard.json):</b> 
Use to replicate dashboards. 
Once imported, a prompt will ask to edit alias. Click (✎) icon, rename and select the target device 
from dropdown. Read [Dashboard_AdminDoc.pdf](https://github.com/iotbang/wisense_dashboard_sdk/blob/master/Dashboard_AdminDoc.pdf) for detailed setup.
    
<b>2. [mastercontrols.json](https://github.com/iotbang/wisense_dashboard_sdk/blob/master/master_controls.json):</b>
Common for all admin accounts unless otherwise required. 
This dashboard is used by customer to set Email ids and mobile numbers for sending out alerts. 
Dashboard is manadatory to present in all dashboard admin accounts.

<b>3. [wisense_api_secrets.json](https://github.com/iotbang/wisense_dashboard_sdk/blob/master/wisense_api_secrets.json):</b> This dashboard mandatory in all admin accounts. 
As of now, dashboard is used to manage WiSense Textlocal account API key and sender name. 
No customer account should be given access to this dashboard.

# IV. Rule-chain JSON files: 
<b>[create_and_clear_alarms.json](https://github.com/iotbang/wisense_dashboard_sdk/blob/master/create___clear_alarms.json):</b>
Root rule script for "WXI-RH/T-10" device as of now. Based on a next sensor this will extend with
more sensor ids.
