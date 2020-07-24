metadata.val = msg.details.temperature;

var dateObj = new Date();
dateObj = dateObj.toString().slice(4, 24) + " IST";

metadata.sender = metadata.sendername;
metadata.apikey = metadata.smsapi;
metadata.numbers = metadata.mobiles;
metadata.message = "Attention! Dear Customer, Device " + msg.details.mac + " from " + metadata.deviceName + " reporting high " + msg.details.type + ",  " + metadata.val + " " + msg.details.unit + " - WiSense Dashboard (" + dateObj + ")";

// var req_str = "apikey="+apikey+"&sender="+sender+"&numbers="+numbers+"&message="+message;

if (msg.details.sts === true) {
    return {msg: msg, metadata: metadata, msgType: msgType};
}