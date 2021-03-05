// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Patch _$PatchFromJson(Map<String, dynamic> json) {
  return $checkedNew('Patch', json, () {
    final val = Patch();
    $checkedConvert(json, 'small', (v) => val.small = v as String);
    $checkedConvert(json, 'large', (v) => val.large = v as String);
    return val;
  });
}

Map<String, dynamic> _$PatchToJson(Patch instance) => <String, dynamic>{
      'small': instance.small,
      'large': instance.large,
    };
