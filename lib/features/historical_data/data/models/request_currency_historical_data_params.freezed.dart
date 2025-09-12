// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_currency_historical_data_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RequestCurrencyHistoricalDataParams {

 String get currencyId; DateTime get date; DateTime get endDate; String get compact;
/// Create a copy of RequestCurrencyHistoricalDataParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestCurrencyHistoricalDataParamsCopyWith<RequestCurrencyHistoricalDataParams> get copyWith => _$RequestCurrencyHistoricalDataParamsCopyWithImpl<RequestCurrencyHistoricalDataParams>(this as RequestCurrencyHistoricalDataParams, _$identity);

  /// Serializes this RequestCurrencyHistoricalDataParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestCurrencyHistoricalDataParams&&(identical(other.currencyId, currencyId) || other.currencyId == currencyId)&&(identical(other.date, date) || other.date == date)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.compact, compact) || other.compact == compact));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currencyId,date,endDate,compact);

@override
String toString() {
  return 'RequestCurrencyHistoricalDataParams(currencyId: $currencyId, date: $date, endDate: $endDate, compact: $compact)';
}


}

/// @nodoc
abstract mixin class $RequestCurrencyHistoricalDataParamsCopyWith<$Res>  {
  factory $RequestCurrencyHistoricalDataParamsCopyWith(RequestCurrencyHistoricalDataParams value, $Res Function(RequestCurrencyHistoricalDataParams) _then) = _$RequestCurrencyHistoricalDataParamsCopyWithImpl;
@useResult
$Res call({
 String currencyId, DateTime date, DateTime endDate, String compact
});




}
/// @nodoc
class _$RequestCurrencyHistoricalDataParamsCopyWithImpl<$Res>
    implements $RequestCurrencyHistoricalDataParamsCopyWith<$Res> {
  _$RequestCurrencyHistoricalDataParamsCopyWithImpl(this._self, this._then);

  final RequestCurrencyHistoricalDataParams _self;
  final $Res Function(RequestCurrencyHistoricalDataParams) _then;

/// Create a copy of RequestCurrencyHistoricalDataParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currencyId = null,Object? date = null,Object? endDate = null,Object? compact = null,}) {
  return _then(_self.copyWith(
currencyId: null == currencyId ? _self.currencyId : currencyId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,compact: null == compact ? _self.compact : compact // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestCurrencyHistoricalDataParams].
extension RequestCurrencyHistoricalDataParamsPatterns on RequestCurrencyHistoricalDataParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestCurrencyHistoricalDataParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestCurrencyHistoricalDataParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestCurrencyHistoricalDataParams value)  $default,){
final _that = this;
switch (_that) {
case _RequestCurrencyHistoricalDataParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestCurrencyHistoricalDataParams value)?  $default,){
final _that = this;
switch (_that) {
case _RequestCurrencyHistoricalDataParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String currencyId,  DateTime date,  DateTime endDate,  String compact)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestCurrencyHistoricalDataParams() when $default != null:
return $default(_that.currencyId,_that.date,_that.endDate,_that.compact);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String currencyId,  DateTime date,  DateTime endDate,  String compact)  $default,) {final _that = this;
switch (_that) {
case _RequestCurrencyHistoricalDataParams():
return $default(_that.currencyId,_that.date,_that.endDate,_that.compact);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String currencyId,  DateTime date,  DateTime endDate,  String compact)?  $default,) {final _that = this;
switch (_that) {
case _RequestCurrencyHistoricalDataParams() when $default != null:
return $default(_that.currencyId,_that.date,_that.endDate,_that.compact);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestCurrencyHistoricalDataParams implements RequestCurrencyHistoricalDataParams {
  const _RequestCurrencyHistoricalDataParams({required this.currencyId, required this.date, required this.endDate, this.compact = 'ultra'});
  factory _RequestCurrencyHistoricalDataParams.fromJson(Map<String, dynamic> json) => _$RequestCurrencyHistoricalDataParamsFromJson(json);

@override final  String currencyId;
@override final  DateTime date;
@override final  DateTime endDate;
@override@JsonKey() final  String compact;

/// Create a copy of RequestCurrencyHistoricalDataParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestCurrencyHistoricalDataParamsCopyWith<_RequestCurrencyHistoricalDataParams> get copyWith => __$RequestCurrencyHistoricalDataParamsCopyWithImpl<_RequestCurrencyHistoricalDataParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestCurrencyHistoricalDataParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestCurrencyHistoricalDataParams&&(identical(other.currencyId, currencyId) || other.currencyId == currencyId)&&(identical(other.date, date) || other.date == date)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.compact, compact) || other.compact == compact));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currencyId,date,endDate,compact);

@override
String toString() {
  return 'RequestCurrencyHistoricalDataParams(currencyId: $currencyId, date: $date, endDate: $endDate, compact: $compact)';
}


}

/// @nodoc
abstract mixin class _$RequestCurrencyHistoricalDataParamsCopyWith<$Res> implements $RequestCurrencyHistoricalDataParamsCopyWith<$Res> {
  factory _$RequestCurrencyHistoricalDataParamsCopyWith(_RequestCurrencyHistoricalDataParams value, $Res Function(_RequestCurrencyHistoricalDataParams) _then) = __$RequestCurrencyHistoricalDataParamsCopyWithImpl;
@override @useResult
$Res call({
 String currencyId, DateTime date, DateTime endDate, String compact
});




}
/// @nodoc
class __$RequestCurrencyHistoricalDataParamsCopyWithImpl<$Res>
    implements _$RequestCurrencyHistoricalDataParamsCopyWith<$Res> {
  __$RequestCurrencyHistoricalDataParamsCopyWithImpl(this._self, this._then);

  final _RequestCurrencyHistoricalDataParams _self;
  final $Res Function(_RequestCurrencyHistoricalDataParams) _then;

/// Create a copy of RequestCurrencyHistoricalDataParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currencyId = null,Object? date = null,Object? endDate = null,Object? compact = null,}) {
  return _then(_RequestCurrencyHistoricalDataParams(
currencyId: null == currencyId ? _self.currencyId : currencyId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,compact: null == compact ? _self.compact : compact // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
