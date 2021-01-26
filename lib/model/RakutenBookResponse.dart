import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_books_search/model/RakutenBookVolumeInfoResponse.dart';
part 'RakutenBookResponse.freezed.dart';
part 'RakutenBookResponse.g.dart';

@freezed
abstract class RakutenBookResponse with _$RakutenBookResponse {
  const factory RakutenBookResponse({
    // Booksでも書いたけど、Itemsデコードしたけど中にItemがあるから、それをデコード
    // 中のJSON形式はキッチリ書かないと取得できないようにしてるからVolumeInfoの中に
    // 正式名称で変数として入れる。ここの関数ぶっちゃけいらないかも（Amazonになるとわからん）
    RakutenBookVolumeInfoResponse Item,
  }) = _RakutenBookResponse;

  factory RakutenBookResponse.fromJson(Map<String, dynamic> json) =>
      _$RakutenBookResponseFromJson(json);
}
