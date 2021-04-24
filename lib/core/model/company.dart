
import 'package:flutter_project/core/model/links.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable(
    checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class Company {
  String name;
  String founder;
  int founded;
  int employees;
  int vehicles;
  int launchSites;
  int valuation;
  String summary;

  Company();


  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}