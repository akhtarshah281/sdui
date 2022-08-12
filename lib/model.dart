import 'dart:convert';

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
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  bool? success;
  String? serverTime;
  Data? data;

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

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    this.sections,
  });

  Data.fromJson(dynamic json) {
    if (json['sections'] != null) {
      sections = [];
      json['sections'].forEach((v) {
        sections?.add(Sections.fromJson(v));
      });
    }
  }

  List<Sections>? sections;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (sections != null) {
      map['sections'] = sections?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

Sections sectionsFromJson(String str) => Sections.fromJson(json.decode(str));

String sectionsToJson(Sections data) => json.encode(data.toJson());

class Sections {
  Sections({
    this.en,
    this.ar,
  });

  Sections.fromJson(dynamic json) {
    en = json['en'] != null ? En.fromJson(json['en']) : null;
    ar = json['ar'];
  }

  En? en;
  dynamic ar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (en != null) {
      map['en'] = en?.toJson();
    }
    map['ar'] = ar;
    return map;
  }
}

En enFromJson(String str) => En.fromJson(json.decode(str));

String enToJson(En data) => json.encode(data.toJson());

class En {
  En({
    this.sortOrder,
    this.uiType,
    this.content,
    this.action,
  });

  En.fromJson(dynamic json) {
    sortOrder = json['sort_order'];
    uiType = json['ui_type'];
    content = json['content'];
    if (json['action'] != null) {
      action = [];
      json['action'].forEach((v) {
        action?.add(Action.fromJson(v));
      });
    }
  }

  int? sortOrder;
  String? uiType;
  dynamic content;
  List<Action>? action;

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

Action actionFromJson(String str) => Action.fromJson(json.decode(str));

String actionToJson(Action data) => json.encode(data.toJson());

class Action {
  Action({
    this.uiType,
    this.title,
    this.subtitle,
    this.prefixIcon,
    this.suffixIcon,
    this.name,
    this.route,
    this.type,
  });

  Action.fromJson(dynamic json) {
    uiType = json['ui_type'];
    title = json['title'];
    subtitle = json['subtitle'];
    prefixIcon = json['prefix_icon'];
    suffixIcon = json['suffix_icon'];
    name = json['name'];
    route = json['route'];
    type = json['type'];
  }

  String? uiType;
  String? title;
  String? subtitle;
  String? prefixIcon;
  String? suffixIcon;
  String? name;
  String? route;
  String? type;

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
