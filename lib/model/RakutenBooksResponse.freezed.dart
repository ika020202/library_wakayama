// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'RakutenBooksResponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
RakutenBooksResponse _$RakutenBooksResponseFromJson(Map<String, dynamic> json) {
  return _RakutenBooksResponse.fromJson(json);
}

class _$RakutenBooksResponseTearOff {
  const _$RakutenBooksResponseTearOff();

// ignore: unused_element
  _RakutenBooksResponse call({int pageCount, List<RakutenBookResponse> Items}) {
    return _RakutenBooksResponse(
      pageCount: pageCount,
      Items: Items,
    );
  }
}

// ignore: unused_element
const $RakutenBooksResponse = _$RakutenBooksResponseTearOff();

mixin _$RakutenBooksResponse {
  int get pageCount;
  List<RakutenBookResponse> get Items;

  Map<String, dynamic> toJson();
  $RakutenBooksResponseCopyWith<RakutenBooksResponse> get copyWith;
}

abstract class $RakutenBooksResponseCopyWith<$Res> {
  factory $RakutenBooksResponseCopyWith(RakutenBooksResponse value,
          $Res Function(RakutenBooksResponse) then) =
      _$RakutenBooksResponseCopyWithImpl<$Res>;
  $Res call({int pageCount, List<RakutenBookResponse> Items});
}

class _$RakutenBooksResponseCopyWithImpl<$Res>
    implements $RakutenBooksResponseCopyWith<$Res> {
  _$RakutenBooksResponseCopyWithImpl(this._value, this._then);

  final RakutenBooksResponse _value;
  // ignore: unused_field
  final $Res Function(RakutenBooksResponse) _then;

  @override
  $Res call({
    Object pageCount = freezed,
    Object Items = freezed,
  }) {
    return _then(_value.copyWith(
      pageCount: pageCount == freezed ? _value.pageCount : pageCount as int,
      Items:
          Items == freezed ? _value.Items : Items as List<RakutenBookResponse>,
    ));
  }
}

abstract class _$RakutenBooksResponseCopyWith<$Res>
    implements $RakutenBooksResponseCopyWith<$Res> {
  factory _$RakutenBooksResponseCopyWith(_RakutenBooksResponse value,
          $Res Function(_RakutenBooksResponse) then) =
      __$RakutenBooksResponseCopyWithImpl<$Res>;
  @override
  $Res call({int pageCount, List<RakutenBookResponse> Items});
}

class __$RakutenBooksResponseCopyWithImpl<$Res>
    extends _$RakutenBooksResponseCopyWithImpl<$Res>
    implements _$RakutenBooksResponseCopyWith<$Res> {
  __$RakutenBooksResponseCopyWithImpl(
      _RakutenBooksResponse _value, $Res Function(_RakutenBooksResponse) _then)
      : super(_value, (v) => _then(v as _RakutenBooksResponse));

  @override
  _RakutenBooksResponse get _value => super._value as _RakutenBooksResponse;

  @override
  $Res call({
    Object pageCount = freezed,
    Object Items = freezed,
  }) {
    return _then(_RakutenBooksResponse(
      pageCount: pageCount == freezed ? _value.pageCount : pageCount as int,
      Items:
          Items == freezed ? _value.Items : Items as List<RakutenBookResponse>,
    ));
  }
}

@JsonSerializable()
class _$_RakutenBooksResponse
    with DiagnosticableTreeMixin
    implements _RakutenBooksResponse {
  const _$_RakutenBooksResponse({this.pageCount, this.Items});

  factory _$_RakutenBooksResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_RakutenBooksResponseFromJson(json);

  @override
  final int pageCount;
  @override
  final List<RakutenBookResponse> Items;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RakutenBooksResponse(pageCount: $pageCount, Items: $Items)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RakutenBooksResponse'))
      ..add(DiagnosticsProperty('pageCount', pageCount))
      ..add(DiagnosticsProperty('Items', Items));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RakutenBooksResponse &&
            (identical(other.pageCount, pageCount) ||
                const DeepCollectionEquality()
                    .equals(other.pageCount, pageCount)) &&
            (identical(other.Items, Items) ||
                const DeepCollectionEquality().equals(other.Items, Items)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(pageCount) ^
      const DeepCollectionEquality().hash(Items);

  @override
  _$RakutenBooksResponseCopyWith<_RakutenBooksResponse> get copyWith =>
      __$RakutenBooksResponseCopyWithImpl<_RakutenBooksResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RakutenBooksResponseToJson(this);
  }
}

abstract class _RakutenBooksResponse implements RakutenBooksResponse {
  const factory _RakutenBooksResponse(
      {int pageCount,
      List<RakutenBookResponse> Items}) = _$_RakutenBooksResponse;

  factory _RakutenBooksResponse.fromJson(Map<String, dynamic> json) =
      _$_RakutenBooksResponse.fromJson;

  @override
  int get pageCount;
  @override
  List<RakutenBookResponse> get Items;
  @override
  _$RakutenBooksResponseCopyWith<_RakutenBooksResponse> get copyWith;
}
