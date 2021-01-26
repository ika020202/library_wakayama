// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'RakutenBookResponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
RakutenBookResponse _$RakutenBookResponseFromJson(Map<String, dynamic> json) {
  return _RakutenBookResponse.fromJson(json);
}

class _$RakutenBookResponseTearOff {
  const _$RakutenBookResponseTearOff();

// ignore: unused_element
  _RakutenBookResponse call({RakutenBookVolumeInfoResponse Item}) {
    return _RakutenBookResponse(
      Item: Item,
    );
  }
}

// ignore: unused_element
const $RakutenBookResponse = _$RakutenBookResponseTearOff();

mixin _$RakutenBookResponse {
  RakutenBookVolumeInfoResponse get Item;

  Map<String, dynamic> toJson();
  $RakutenBookResponseCopyWith<RakutenBookResponse> get copyWith;
}

abstract class $RakutenBookResponseCopyWith<$Res> {
  factory $RakutenBookResponseCopyWith(
          RakutenBookResponse value, $Res Function(RakutenBookResponse) then) =
      _$RakutenBookResponseCopyWithImpl<$Res>;
  $Res call({RakutenBookVolumeInfoResponse Item});

  $RakutenBookVolumeInfoResponseCopyWith<$Res> get Item;
}

class _$RakutenBookResponseCopyWithImpl<$Res>
    implements $RakutenBookResponseCopyWith<$Res> {
  _$RakutenBookResponseCopyWithImpl(this._value, this._then);

  final RakutenBookResponse _value;
  // ignore: unused_field
  final $Res Function(RakutenBookResponse) _then;

  @override
  $Res call({
    Object Item = freezed,
  }) {
    return _then(_value.copyWith(
      Item:
          Item == freezed ? _value.Item : Item as RakutenBookVolumeInfoResponse,
    ));
  }

  @override
  $RakutenBookVolumeInfoResponseCopyWith<$Res> get Item {
    if (_value.Item == null) {
      return null;
    }
    return $RakutenBookVolumeInfoResponseCopyWith<$Res>(_value.Item, (value) {
      return _then(_value.copyWith(Item: value));
    });
  }
}

abstract class _$RakutenBookResponseCopyWith<$Res>
    implements $RakutenBookResponseCopyWith<$Res> {
  factory _$RakutenBookResponseCopyWith(_RakutenBookResponse value,
          $Res Function(_RakutenBookResponse) then) =
      __$RakutenBookResponseCopyWithImpl<$Res>;
  @override
  $Res call({RakutenBookVolumeInfoResponse Item});

  @override
  $RakutenBookVolumeInfoResponseCopyWith<$Res> get Item;
}

class __$RakutenBookResponseCopyWithImpl<$Res>
    extends _$RakutenBookResponseCopyWithImpl<$Res>
    implements _$RakutenBookResponseCopyWith<$Res> {
  __$RakutenBookResponseCopyWithImpl(
      _RakutenBookResponse _value, $Res Function(_RakutenBookResponse) _then)
      : super(_value, (v) => _then(v as _RakutenBookResponse));

  @override
  _RakutenBookResponse get _value => super._value as _RakutenBookResponse;

  @override
  $Res call({
    Object Item = freezed,
  }) {
    return _then(_RakutenBookResponse(
      Item:
          Item == freezed ? _value.Item : Item as RakutenBookVolumeInfoResponse,
    ));
  }
}

@JsonSerializable()
class _$_RakutenBookResponse
    with DiagnosticableTreeMixin
    implements _RakutenBookResponse {
  const _$_RakutenBookResponse({this.Item});

  factory _$_RakutenBookResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_RakutenBookResponseFromJson(json);

  @override
  final RakutenBookVolumeInfoResponse Item;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RakutenBookResponse(Item: $Item)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RakutenBookResponse'))
      ..add(DiagnosticsProperty('Item', Item));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RakutenBookResponse &&
            (identical(other.Item, Item) ||
                const DeepCollectionEquality().equals(other.Item, Item)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(Item);

  @override
  _$RakutenBookResponseCopyWith<_RakutenBookResponse> get copyWith =>
      __$RakutenBookResponseCopyWithImpl<_RakutenBookResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RakutenBookResponseToJson(this);
  }
}

abstract class _RakutenBookResponse implements RakutenBookResponse {
  const factory _RakutenBookResponse({RakutenBookVolumeInfoResponse Item}) =
      _$_RakutenBookResponse;

  factory _RakutenBookResponse.fromJson(Map<String, dynamic> json) =
      _$_RakutenBookResponse.fromJson;

  @override
  RakutenBookVolumeInfoResponse get Item;
  @override
  _$RakutenBookResponseCopyWith<_RakutenBookResponse> get copyWith;
}
