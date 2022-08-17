import 'dart:convert';

import 'package:sdui_demo/models/sections_model.dart';

DataModel dataFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel({
    this.sections,
  });

  List<SectionsModel>? sections;

  DataModel.fromJson(dynamic json) {
    if (json['sections'] != null) {
      sections = [];
      json['sections'].forEach((v) {
        sections?.add(SectionsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (sections != null) {
      map['sections'] = sections?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
