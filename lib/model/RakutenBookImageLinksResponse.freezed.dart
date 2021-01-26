// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'RakutenBookImageLinksResponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
RakutenBookImageLinksResponse _$RakutenBookImageLinksResponseFromJson(
    Map<String, dynamic> json) {
  return _RakutenBookImageLinksResponse.fromJson(json);
}

class _$RakutenBookImageLinksResponseTearOff {
  const _$RakutenBookImageLinksResponseTearOff();

// ignore: unused_element
  _RakutenBookImageLinksResponse call(
      {String smallThumbnail, String thumbnail}) {
    return _RakutenBookImageLinksResponse(
      smallThumbnail: smallThumbnail,
      thumbnail: thumbnail,
    );
  }
}

// ignore: unused_element
const $RakutenBookImageLinksResponse = _$RakutenBookImageLinksResponseTearOff();

mixin _$RakutenBookImageLinksResponse {
  String get smallThumbnail;
  String get thumbnail;

  Map<String, dynamic> toJson();
  $RakutenBookImageLinksResponseCopyWith<RakutenBookImageLinksResponse>
      get copyWith;
}

abstract class $RakutenBookImageLinksResponseCopyWith<$Res> {
  factory $RakutenBookImageLinksResponseCopyWith(
          RakutenBookImageLinksResponse value,
          $Res Function(RakutenBookImageLinksResponse) then) =
      _$RakutenBookImageLinksResponseCopyWithImpl<$Res>;
  $Res call({String smallThumbnail, String thumbnail});
}

class _$RakutenBookImageLinksResponseCopyWithImpl<$Res>
    implements $RakutenBookImageLinksResponseCopyWith<$Res> {
  _$RakutenBookImageLinksResponseCopyWithImpl(this._value, this._then);

  final RakutenBookImageLinksResponse _value;
  // ignore: unused_field
  final $Res Function(RakutenBookImageLinksResponse) _then;

  @override
  $Res call({
    Object smallThumbnail = freezed,
    Object thumbnail = freezed,
  }) {
    return _then(_value.copyWith(
      smallThumbnail: smallThumbnail == freezed
          ? _value.smallThumbnail
          : smallThumbnail as String,
      thumbnail: thumbnail == freezed ? _value.thumbnail : thumbnail as String,
    ));
  }
}

abstract class _$RakutenBookImageLinksResponseCopyWith<$Res>
    implements $RakutenBookImageLinksResponseCopyWith<$Res> {
  factory _$RakutenBookImageLinksResponseCopyWith(
          _RakutenBookImageLinksResponse value,
          $Res Function(_RakutenBookImageLinksResponse) then) =
      __$RakutenBookImageLinksResponseCopyWithImpl<$Res>;
  @override
  $Res call({String smallThumbnail, String thumbnail});
}

class __$RakutenBookImageLinksResponseCopyWithImpl<$Res>
    extends _$RakutenBookImageLinksResponseCopyWithImpl<$Res>
    implements _$RakutenBookImageLinksResponseCopyWith<$Res> {
  __$RakutenBookImageLinksResponseCopyWithImpl(
      _RakutenBookImageLinksResponse _value,
      $Res Function(_RakutenBookImageLinksResponse) _then)
      : super(_value, (v) => _then(v as _RakutenBookImageLinksResponse));

  @override
  _RakutenBookImageLinksResponse get _value =>
      super._value as _RakutenBookImageLinksResponse;

  @override
  $Res call({
    Object smallThumbnail = freezed,
    Object thumbnail = freezed,
  }) {
    return _then(_RakutenBookImageLinksResponse(
      smallThumbnail: smallThumbnail == freezed
          ? _value.smallThumbnail
          : smallThumbnail as String,
      thumbnail: thumbnail == freezed ? _value.thumbnail : thumbnail as String,
    ));
  }
}

@JsonSerializable()
class _$_RakutenBookImageLinksResponse
    with DiagnosticableTreeMixin
    implements _RakutenBookImageLinksResponse {
  const _$_RakutenBookImageLinksResponse({this.smallThumbnail, this.thumbnail});

  factory _$_RakutenBookImageLinksResponse.fromJson(
          Map<String, dynamic> json) =>
      _$_$_RakutenBookImageLinksResponseFromJson(json);

  @override
  final String smallThumbnail;
  @override
  final String thumbnail;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RakutenBookImageLinksResponse(smallThumbnail: $smallThumbnail, thumbnail: $thumbnail)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RakutenBookImageLinksResponse'))
      ..add(DiagnosticsProperty('smallThumbnail', smallThumbnail))
      ..add(DiagnosticsProperty('thumbnail', thumbnail));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RakutenBookImageLinksResponse &&
            (identical(other.smallThumbnail, smallThumbnail) ||
                const DeepCollectionEquality()
                    .equals(other.smallThumbnail, smallThumbnail)) &&
            (identical(other.thumbnail, thumbnail) ||
                const DeepCollectionEquality()
                    .equals(other.thumbnail, thumbnail)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(smallThumbnail) ^
      const DeepCollectionEquality().hash(thumbnail);

  @override
  _$RakutenBookImageLinksResponseCopyWith<_RakutenBookImageLinksResponse>
      get copyWith => __$RakutenBookImageLinksResponseCopyWithImpl<
          _RakutenBookImageLinksResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RakutenBookImageLinksResponseToJson(this);
  }
}

abstract class _RakutenBookImageLinksResponse
    implements RakutenBookImageLinksResponse {
  const factory _RakutenBookImageLinksResponse(
      {String smallThumbnail,
      String thumbnail}) = _$_RakutenBookImageLinksResponse;

  factory _RakutenBookImageLinksResponse.fromJson(Map<String, dynamic> json) =
      _$_RakutenBookImageLinksResponse.fromJson;

  @override
  String get smallThumbnail;
  @override
  String get thumbnail;
  @override
  _$RakutenBookImageLinksResponseCopyWith<_RakutenBookImageLinksResponse>
      get copyWith;
}
