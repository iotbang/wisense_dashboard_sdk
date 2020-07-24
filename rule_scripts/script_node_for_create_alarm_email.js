if (msg.details.sts === true) {
    
    var dateObj = new Date();
    dateObj = dateObj.toString().slice(4, 24);
    metadata.timeNow = dateObj + " IST";
    metadata.val = msg.details.temperature;
    metadata.mac = msg.details.mac;
    metadata.type = msg.details.type;
    metadata.unit = msg.details.unit;
    
    return {msg: msg.details, metadata: metadata, msgType: msgType};
    
}