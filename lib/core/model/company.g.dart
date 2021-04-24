// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) {
  return $checkedNew('Company', json, () {
    final val = Company();
    $checkedConvert(json, 'name', (v) => val.name = v as String);
    $checkedConvert(json, 'founder', (v) => val.founder = v as String);
    $checkedConvert(json, 'founded', (v) => val.founded = v as int);
    $checkedConvert(json, 'employees', (v) => val.employees = v as int);
    $checkedConvert(json, 'vehicles', (v) => val.vehicles = v as int);
    $checkedConvert(json, 'launch_sites', (v) => val.launchSites = v as int);
    $checkedConvert(json, 'valuation', (v) => val.valuation = v as int);
    $checkedConvert(json, 'summary', (v) => val.summary = v as String);
    return val;
  }, fieldKeyMap: const {'launchSites': 'launch_sites'});
}

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'name': instance.name,
      'founder': instance.founder,
      'founded': instance.founded,
      'employees': instance.employees,
      'vehicles': instance.vehicles,
      'launch_sites': instance.launchSites,
      'valuation': instance.valuation,
      'summary': instance.summary,
    };
