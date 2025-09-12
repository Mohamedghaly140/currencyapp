// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_currency_converter_data_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RequestCurrencyConverterDataParams {

 String get currencyId; String get compact;
/// Create a copy of RequestCurrencyConverterDataParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestCurrencyConverterDataParamsCopyWith<RequestCurrencyConverterDataParams> get copyWith => _$RequestCurrencyConverterDataParamsCopyWithImpl<RequestCurrencyConverterDataParams>(this as RequestCurrencyConverterDataParams, _$identity);

  /// Serializes this RequestCurrencyConverterDataParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestCurrencyConverterDataParams&&(identical(other.currencyId, currencyId) || other.currencyId == currencyId)&&(identical(other.compact, compact) || other.compact == compact));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currencyId,compact);

@override
String toString() {
  return 'RequestCurrencyConverterDataParams(currencyId: $currencyId, compact: $compact)';
}


}

/// @nodoc
abstract mixin class $RequestCurrencyConverterDataParamsCopyWith<$Res>  {
  factory $RequestCurrencyConverterDataParamsCopyWith(RequestCurrencyConverterDataParams value, $Res Function(RequestCurrencyConverterDataParams) _then) = _$RequestCurrencyConverterDataParamsCopyWithImpl;
@useResult
$Res call({
 String currencyId, String compact
});




}
/// @nodoc
class _$RequestCurrencyConverterDataParamsCopyWithImpl<$Res>
    implements $RequestCurrencyConverterDataParamsCopyWith<$Res> {
  _$RequestCurrencyConverterDataParamsCopyWithImpl(this._self, this._then);

  final RequestCurrencyConverterDataParams _self;
  final $Res Function(RequestCurrencyConverterDataParams) _then;

/// Create a copy of RequestCurrencyConverterDataParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currencyId = null,Object? compact = null,}) {
  return _then(_self.copyWith(
currencyId: null == currencyId ? _self.currencyId : currencyId // ignore: cast_nullable_to_non_nullable
as String,compact: null == compact ? _self.compact : compact // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestCurrencyConverterDataParams].
extension RequestCurrencyConverterDataParamsPatterns on RequestCurrencyConverterDataParams {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestCurrencyConverterDataParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestCurrencyConverterDataParams() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestCurrencyConverterDataParams value)  $default,){
final _that = this;
switch (_that) {
case _RequestCurrencyConverterDataParams():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestCurrencyConverterDataParams value)?  $default,){
final _that = this;
switch (_that) {
case _RequestCurrencyConverterDataParams() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String currencyId,  String compact)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestCurrencyConverterDataParams() when $default != null:
return $default(_that.currencyId,_that.compact);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String currencyId,  String compact)  $default,) {final _that = this;
switch (_that) {
case _RequestCurrencyConverterDataParams():
return $default(_that.currencyId,_that.compact);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String currencyId,  String compact)?  $default,) {final _that = this;
switch (_that) {
case _RequestCurrencyConverterDataParams() when $default != null:
return $default(_that.currencyId,_that.compact);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestCurrencyConverterDataParams implements RequestCurrencyConverterDataParams {
  const _RequestCurrencyConverterDataParams({required this.currencyId, this.compact = 'ultra'});
  factory _RequestCurrencyConverterDataParams.fromJson(Map<String, dynamic> json) => _$RequestCurrencyConverterDataParamsFromJson(json);

@override final  String currencyId;
@override@JsonKey() final  String compact;

/// Create a copy of RequestCurrencyConverterDataParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestCurrencyConverterDataParamsCopyWith<_RequestCurrencyConverterDataParams> get copyWith => __$RequestCurrencyConverterDataParamsCopyWithImpl<_RequestCurrencyConverterDataParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestCurrencyConverterDataParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestCurrencyConverterDataParams&&(identical(other.currencyId, currencyId) || other.currencyId == currencyId)&&(identical(other.compact, compact) || other.compact == compact));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currencyId,compact);

@override
String toString() {
  return 'RequestCurrencyConverterDataParams(currencyId: $currencyId, compact: $compact)';
}


}

/// @nodoc
abstract mixin class _$RequestCurrencyConverterDataParamsCopyWith<$Res> implements $RequestCurrencyConverterDataParamsCopyWith<$Res> {
  factory _$RequestCurrencyConverterDataParamsCopyWith(_RequestCurrencyConverterDataParams value, $Res Function(_RequestCurrencyConverterDataParams) _then) = __$RequestCurrencyConverterDataParamsCopyWithImpl;
@override @useResult
$Res call({
 String currencyId, String compact
});




}
/// @nodoc
class __$RequestCurrencyConverterDataParamsCopyWithImpl<$Res>
    implements _$RequestCurrencyConverterDataParamsCopyWith<$Res> {
  __$RequestCurrencyConverterDataParamsCopyWithImpl(this._self, this._then);

  final _RequestCurrencyConverterDataParams _self;
  final $Res Function(_RequestCurrencyConverterDataParams) _then;

/// Create a copy of RequestCurrencyConverterDataParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currencyId = null,Object? compact = null,}) {
  return _then(_RequestCurrencyConverterDataParams(
currencyId: null == currencyId ? _self.currencyId : currencyId // ignore: cast_nullable_to_non_nullable
as String,compact: null == compact ? _self.compact : compact // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
