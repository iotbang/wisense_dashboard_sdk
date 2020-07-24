var details = {};

details.temperature = msg["0xb3"];
details.mac = msg.MacId;
details.type = "temperature";
details.sts = false; //Flag for sending sms/email.
details.unit = "deg C";

if (metadata.ss_b3_flag === "true") { //attributes are read as strings
    details.sts = true; 
}

return details;

/*
Note:
'details.sts' is not a thingsboard native variable.
If 'true', then mail/sms action will be completed. 
Otherwise mail/sms will not be sent eventhough continuous 
alarm condition exist.
*/
