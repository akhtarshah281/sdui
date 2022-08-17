import 'dart:convert';

ActionModel actionFromJson(String str) =>
    ActionModel.fromJson(json.decode(str));

String actionToJson(ActionModel data) => json.encode(data.toJson());

class ActionModel {
  ActionModel({
    this.uiType,
    this.title,
    this.subtitle,
    this.prefixIcon,
    this.suffixIcon,
    this.name,
    this.route,
    this.type,
  });

  String? uiType;
  String? title;
  String? subtitle;
  String? prefixIcon;
  String? suffixIcon;
  String? name;
  String? route;
  String? type;

  ActionModel.fromJson(dynamic json) {
    uiType = json['ui_type'];
    title = json['title'];
    subtitle = json['subtitle'];
    prefixIcon = json['prefix_icon'];
    suffixIcon = json['suffix_icon'];
    name = json['name'];
    route = json['route'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ui_type'] = uiType;
    map['title'] = title;
    map['subtitle'] = subtitle;
    map['prefix_icon'] = prefixIcon;
    map['suffix_icon'] = suffixIcon;
    map['name'] = name;
    map['route'] = route;
    map['type'] = type;
    return map;
  }
}
