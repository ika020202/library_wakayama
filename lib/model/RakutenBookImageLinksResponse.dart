import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'RakutenBookImageLinksResponse.freezed.dart';
part 'RakutenBookImageLinksResponse.g.dart';

@freezed
abstract class RakutenBookImageLinksResponse
    with _$RakutenBookImageLinksResponse {
  const factory RakutenBookImageLinksResponse(
      {String smallThumbnail,
      String thumbnail}) = _RakutenBookImageLinksResponse;

  factory RakutenBookImageLinksResponse.fromJson(Map<String, dynamic> json) =>
      _$RakutenBookImageLinksResponseFromJson(json);
}
