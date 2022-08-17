import 'dart:convert';

import 'data_model.dart';

ResponseModel responseModelFromJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
  ResponseModel({
    this.success,
    this.serverTime,
    this.data,
  });

  ResponseModel.fromJson(dynamic json) {
    success = json['success'];
    serverTime = json['server_time'];
    data = json['data'] != null ? DataModel.fromJson(json['data']) : null;
  }

  bool? success;
  String? serverTime;
  DataModel? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['server_time'] = serverTime;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}
