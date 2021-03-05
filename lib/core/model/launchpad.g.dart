// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launchpad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Launchpad _$LaunchpadFromJson(Map<String, dynamic> json) {
  return $checkedNew('Launchpad', json, () {
    final val = Launchpad();
    $checkedConvert(
        json, 'latitude', (v) => val.latitude = (v as num)?.toDouble());
    $checkedConvert(
        json, 'longitude', (v) => val.longitude = (v as num)?.toDouble());
    $checkedConvert(json, 'name', (v) => val.name = v as String);
    $checkedConvert(json, 'full_name', (v) => val.fullName = v as String);
    $checkedConvert(json, 'locality', (v) => val.locality = v as String);
    $checkedConvert(json, 'region', (v) => val.region = v as String);
    $checkedConvert(json, 'details', (v) => val.details = v as String);
    return val;
  }, fieldKeyMap: const {'fullName': 'full_name'});
}

Map<String, dynamic> _$LaunchpadToJson(Launchpad instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'name': instance.name,
      'full_name': instance.fullName,
      'locality': instance.locality,
      'region': instance.region,
      'details': instance.details,
    };
