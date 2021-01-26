// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RakutenBookResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RakutenBookResponse _$_$_RakutenBookResponseFromJson(
    Map<String, dynamic> json) {
  return _$_RakutenBookResponse(
    Item: json['Item'] == null
        ? null
        : RakutenBookVolumeInfoResponse.fromJson(
            json['Item'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_RakutenBookResponseToJson(
        _$_RakutenBookResponse instance) =>
    <String, dynamic>{
      'Item': instance.Item,
    };
