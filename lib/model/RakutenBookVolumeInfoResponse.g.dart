// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RakutenBookVolumeInfoResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RakutenBookVolumeInfoResponse _$_$_RakutenBookVolumeInfoResponseFromJson(
    Map<String, dynamic> json) {
  return _$_RakutenBookVolumeInfoResponse(
    title: json['title'] as String,
    subTitle: json['subTitle'] as String,
    seriesName: json['seriesName'] as String,
    contents: json['contents'] as String,
    author: json['author'] as String,
    publisherName: json['publisherName'] as String,
    isbn: json['isbn'] as String,
    itemCaption: json['itemCaption'] as String,
    salesDate: json['salesDate'] as String,
    itemPrice: json['itemPrice'] as int,
    smallImageUrl: json['smallImageUrl'] as String,
    mediumImageUrl: json['mediumImageUrl'] as String,
    largeImageUrl: json['largeImageUrl'] as String,
  );
}

Map<String, dynamic> _$_$_RakutenBookVolumeInfoResponseToJson(
        _$_RakutenBookVolumeInfoResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subTitle': instance.subTitle,
      'seriesName': instance.seriesName,
      'contents': instance.contents,
      'author': instance.author,
      'publisherName': instance.publisherName,
      'isbn': instance.isbn,
      'itemCaption': instance.itemCaption,
      'salesDate': instance.salesDate,
      'itemPrice': instance.itemPrice,
      'smallImageUrl': instance.smallImageUrl,
      'mediumImageUrl': instance.mediumImageUrl,
      'largeImageUrl': instance.largeImageUrl,
    };
