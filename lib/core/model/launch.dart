
import 'package:flutter_project/core/model/links.dart';
import 'package:json_annotation/json_annotation.dart';

part 'launch.g.dart';

@JsonSerializable(
    checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class Launch {
  String details;
  String dateUtc;
  String dateLocal;
  int dateUnix;
  String name;
  Links links;
  String id;
  bool favouriteChecked = false;

  Launch();


  factory Launch.fromJson(Map<String, dynamic> json) => _$LaunchFromJson(json);

  Map<String, dynamic> toJson() => _$LaunchToJson(this);
}