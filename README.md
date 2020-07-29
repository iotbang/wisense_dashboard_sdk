WiSense Dashboard : https://dashboard.wisense.in

I. Device scripts: Use to simulate devices for demo or testing.

II. Rule scripts: Key custom scripts used inside rule chain nodes. These scripts are already implemented in create___clear_alarms.json rule chain.

III. Dahboard JSON files:
yoursampledashboard.json: Use to to replicate dashboards. 
                          Will ask to edit alias when uploaded. Click (✎) icon and rename and slect target device from dropdown.

mastercontrols.json: Common for all admin accounts unless otherwise required. This dashboard is used by customer to give/change
                     email ids and mobile numbers for sending out alerts. This should be present
                     in all dashboard admin accounts.

wisense_api_secrets.json: This dashboard is common and should be present in all admin accounts. 
                          As of now, this will contain WiSense Textlocal account API key and sender name. No customer account
                          or customer will see this dashboard.

IV. Rule-chain JSON files: 
create_and_clear_alarms.json: Root rule script for "WXI-RH/T-10" device as of now. Based on a next sensor this will 
                              extend with more sensor ids.
