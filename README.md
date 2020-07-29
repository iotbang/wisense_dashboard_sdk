# WiSense Dashboard SDK 
(https://dashboard.wisense.in)

# I. Device scripts: 
Use these scripts to simulate devices for demo or testing required at different stages of deployment.<br> 
As of now scripts directly simulate "WXI-RH/T-10" device. Tweak payload according to the required sensor node device.<br>
Read the README included in the device scripts directory.


# II. Rule scripts: 
These are the important custom scripts used inside the rule-chain nodes.
These scripts are implemented in <b>create___clear_alarms.json</b> rule-chain.<br>
In order to alerts and alarm feature work - this rule-chain should be made root.

# III. Dashboard JSON files:
<pre>
<b>1. yoursampledashboard.json:</b> 
Use to to replicate dashboards. 
Once imported, a prompt will ask to edit alias. Click (✎) icon, rename and select the target device from dropdown.

<b>2. mastercontrols.json:</b>
Common for all admin accounts unless otherwise required. 
This dashboard is used by customer to set Email ids and mobile numbers for sending out alerts. 
Dashboard is manadatory to present in all dashboard admin accounts.

<b>3. wisense_api_secrets.json:</b> This dashboard mandatory in all admin accounts. 
As of now, dashboard is used to manage WiSense Textlocal account API key and sender name. 
No customer account should be given access to this dashboard.
</pre>

# IV. Rule-chain JSON files: 
<pre>
<b>create_and_clear_alarms.json:</b>
Root rule script for "WXI-RH/T-10" device as of now. Based on a next sensor this will extend with more 
sensor ids.
</pre>