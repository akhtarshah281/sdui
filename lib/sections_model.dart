import 'dart:convert';

import 'language_model.dart';

SectionsModel sectionsFromJson(String str) =>
    SectionsModel.fromJson(json.decode(str));

String sectionsToJson(SectionsModel data) => json.encode(data.toJson());

class SectionsModel {
  SectionsModel({
    this.en,
    this.ar,
  });

  LanguageModel? en;
  LanguageModel? ar;

  SectionsModel.fromJson(dynamic json) {
    en = json['en'] != null ? LanguageModel.fromJson(json['en']) : null;
    ar = json['ar'] != null ? LanguageModel.fromJson(json['ar']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (en != null) {
      map['en'] = en?.toJson();
    }
    map['ar'] = ar;
    return map;
  }
}
