import 'dart:convert';

import 'data_model.dart';

Model modelFromJson(String str) => Model.fromJson(json.decode(str));

String modelToJson(Model data) => json.encode(data.toJson());

class Model {
  Model({
    this.success,
    this.serverTime,
    this.data,
  });

  Model.fromJson(dynamic json) {
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
