
import 'package:flutter_project/core/model/patch.dart';
import 'package:json_annotation/json_annotation.dart';

part 'launchpad.g.dart';

@JsonSerializable(
    checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class Launchpad {
  double latitude;
  double longitude;
  String name;
  String fullName;
  String locality;
  String region;
  String details;

  Launchpad();

  factory Launchpad.fromJson(Map<String, dynamic> json) => _$LaunchpadFromJson(json);

  Map<String, dynamic> toJson() => _$LaunchpadToJson(this);
}
