import 'dart:convert';

import 'package:sdui_demo/action_model.dart';

LanguageModel enFromJson(String str) =>
    LanguageModel.fromJson(json.decode(str));

String enToJson(LanguageModel data) => json.encode(data.toJson());

class LanguageModel {
  LanguageModel({
    this.sortOrder,
    this.uiType,
    this.content,
    this.action,
  });

  int? sortOrder;
  String? uiType;
  dynamic content;
  List<ActionModel>? action;

  LanguageModel.fromJson(dynamic json) {
    sortOrder = json['sort_order'];
    uiType = json['ui_type'];
    content = json['content'];
    if (json['action'] != null) {
      action = [];
      json['action'].forEach((v) {
        action?.add(ActionModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sort_order'] = sortOrder;
    map['ui_type'] = uiType;
    map['content'] = content;
    if (action != null) {
      map['action'] = action?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
