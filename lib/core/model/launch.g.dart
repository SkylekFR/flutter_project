// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Launch _$LaunchFromJson(Map<String, dynamic> json) {
  return $checkedNew('Launch', json, () {
    final val = Launch();
    $checkedConvert(json, 'details', (v) => val.details = v as String);
    $checkedConvert(json, 'date_utc', (v) => val.dateUtc = v as String);
    $checkedConvert(json, 'date_local', (v) => val.dateLocal = v as String);
    $checkedConvert(json, 'date_unix', (v) => val.dateUnix = v as int);
    $checkedConvert(json, 'name', (v) => val.name = v as String);
    $checkedConvert(
        json,
        'links',
        (v) => val.links =
            v == null ? null : Links.fromJson(v as Map<String, dynamic>));
    return val;
  }, fieldKeyMap: const {
    'dateUtc': 'date_utc',
    'dateLocal': 'date_local',
    'dateUnix': 'date_unix'
  });
}

Map<String, dynamic> _$LaunchToJson(Launch instance) => <String, dynamic>{
      'details': instance.details,
      'date_utc': instance.dateUtc,
      'date_local': instance.dateLocal,
      'date_unix': instance.dateUnix,
      'name': instance.name,
      'links': instance.links?.toJson(),
    };
