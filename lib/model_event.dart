import 'dart:convert';

class ModelEvent {
  String eventName;
  String payloadData;

  ModelEvent({this.eventName, this.payloadData});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eventName'] = this.eventName;
    data['payloadData'] = jsonDecode(this.payloadData);
    return data;
  }
}
