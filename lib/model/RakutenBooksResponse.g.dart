// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RakutenBooksResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RakutenBooksResponse _$_$_RakutenBooksResponseFromJson(
    Map<String, dynamic> json) {
  return _$_RakutenBooksResponse(
    pageCount: json['pageCount'] as int,
    Items: (json['Items'] as List)
        ?.map((e) => e == null
            ? null
            : RakutenBookResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_RakutenBooksResponseToJson(
        _$_RakutenBooksResponse instance) =>
    <String, dynamic>{
      'pageCount': instance.pageCount,
      'Items': instance.Items,
    };
