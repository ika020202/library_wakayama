import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'RakutenBookVolumeInfoResponse.freezed.dart';
part 'RakutenBookVolumeInfoResponse.g.dart';

@freezed
abstract class RakutenBookVolumeInfoResponse
    with _$RakutenBookVolumeInfoResponse {
  const factory RakutenBookVolumeInfoResponse({
    // API値の詳細は楽天BooksAPIを参照（変数名がその意味に対応）
    String title,
    String subTitle,
    String seriesName,
    String contents,
    String author,
    String publisherName,
    String isbn,
    String itemCaption,
    String salesDate,
    int itemPrice,
    String smallImageUrl,
    String mediumImageUrl,
    String largeImageUrl,
  }) = _RakutenBookVolumeInfoResponse;

  factory RakutenBookVolumeInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$RakutenBookVolumeInfoResponseFromJson(json);
}
