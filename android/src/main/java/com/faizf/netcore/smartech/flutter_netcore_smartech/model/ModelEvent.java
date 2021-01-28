package com.faizf.netcore.smartech.flutter_netcore_smartech.model;

import java.util.HashMap;

public class ModelEvent {

    private String eventName;
    private HashMap<String, Object> payloadData;

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public HashMap<String, Object> getPayloadData() {
        return payloadData;
    }

    public void setPayloadData(HashMap<String, Object> payloadData) {
        this.payloadData = payloadData;
    }
}
