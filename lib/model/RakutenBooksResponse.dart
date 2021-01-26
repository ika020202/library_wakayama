import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_books_search/model/RakutenBookResponse.dart';
part 'RakutenBooksResponse.freezed.dart';
part 'RakutenBooksResponse.g.dart';

@freezed
abstract class RakutenBooksResponse with _$RakutenBooksResponse {
  const factory RakutenBooksResponse(
      // 楽天APIのJsonの最初（Items）をデコード、デコード後はBookに飛ぶ
      // Bookではその中のItemをデコード、だからぶっちゃけ意味ないし二度手間、AmazonAPIに
      //なったら意味が出るかもしれない
      {int pageCount,
      List<RakutenBookResponse> Items}) = _RakutenBooksResponse;

  factory RakutenBooksResponse.fromJson(Map<String, dynamic> json) =>
      _$RakutenBooksResponseFromJson(json);
}
