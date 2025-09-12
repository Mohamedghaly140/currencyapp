// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_converter_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CurrencyConverterState {

// get currencies request state
 RequestState get getCurrencyConverterRequestState;// currency converter data
 CurrencyConverterResponseModel? get currencyConverterData;// source currency
 CountryModel? get sourceCountry;// target country
 CountryModel? get targetCountry;// exchange rate
 double get exchangeRate;// converted amount
 double get convertedAmount;// error message
 String? get errorMessage;
/// Create a copy of CurrencyConverterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrencyConverterStateCopyWith<CurrencyConverterState> get copyWith => _$CurrencyConverterStateCopyWithImpl<CurrencyConverterState>(this as CurrencyConverterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrencyConverterState&&(identical(other.getCurrencyConverterRequestState, getCurrencyConverterRequestState) || other.getCurrencyConverterRequestState == getCurrencyConverterRequestState)&&(identical(other.currencyConverterData, currencyConverterData) || other.currencyConverterData == currencyConverterData)&&(identical(other.sourceCountry, sourceCountry) || other.sourceCountry == sourceCountry)&&(identical(other.targetCountry, targetCountry) || other.targetCountry == targetCountry)&&(identical(other.exchangeRate, exchangeRate) || other.exchangeRate == exchangeRate)&&(identical(other.convertedAmount, convertedAmount) || other.convertedAmount == convertedAmount)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,getCurrencyConverterRequestState,currencyConverterData,sourceCountry,targetCountry,exchangeRate,convertedAmount,errorMessage);

@override
String toString() {
  return 'CurrencyConverterState(getCurrencyConverterRequestState: $getCurrencyConverterRequestState, currencyConverterData: $currencyConverterData, sourceCountry: $sourceCountry, targetCountry: $targetCountry, exchangeRate: $exchangeRate, convertedAmount: $convertedAmount, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $CurrencyConverterStateCopyWith<$Res>  {
  factory $CurrencyConverterStateCopyWith(CurrencyConverterState value, $Res Function(CurrencyConverterState) _then) = _$CurrencyConverterStateCopyWithImpl;
@useResult
$Res call({
 RequestState getCurrencyConverterRequestState, CurrencyConverterResponseModel? currencyConverterData, CountryModel? sourceCountry, CountryModel? targetCountry, double exchangeRate, double convertedAmount, String? errorMessage
});




}
/// @nodoc
class _$CurrencyConverterStateCopyWithImpl<$Res>
    implements $CurrencyConverterStateCopyWith<$Res> {
  _$CurrencyConverterStateCopyWithImpl(this._self, this._then);

  final CurrencyConverterState _self;
  final $Res Function(CurrencyConverterState) _then;

/// Create a copy of CurrencyConverterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? getCurrencyConverterRequestState = null,Object? currencyConverterData = freezed,Object? sourceCountry = freezed,Object? targetCountry = freezed,Object? exchangeRate = null,Object? convertedAmount = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
getCurrencyConverterRequestState: null == getCurrencyConverterRequestState ? _self.getCurrencyConverterRequestState : getCurrencyConverterRequestState // ignore: cast_nullable_to_non_nullable
as RequestState,currencyConverterData: freezed == currencyConverterData ? _self.currencyConverterData : currencyConverterData // ignore: cast_nullable_to_non_nullable
as CurrencyConverterResponseModel?,sourceCountry: freezed == sourceCountry ? _self.sourceCountry : sourceCountry // ignore: cast_nullable_to_non_nullable
as CountryModel?,targetCountry: freezed == targetCountry ? _self.targetCountry : targetCountry // ignore: cast_nullable_to_non_nullable
as CountryModel?,exchangeRate: null == exchangeRate ? _self.exchangeRate : exchangeRate // ignore: cast_nullable_to_non_nullable
as double,convertedAmount: null == convertedAmount ? _self.convertedAmount : convertedAmount // ignore: cast_nullable_to_non_nullable
as double,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CurrencyConverterState].
extension CurrencyConverterStatePatterns on CurrencyConverterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CurrencyConverterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CurrencyConverterState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CurrencyConverterState value)  $default,){
final _that = this;
switch (_that) {
case _CurrencyConverterState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CurrencyConverterState value)?  $default,){
final _that = this;
switch (_that) {
case _CurrencyConverterState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RequestState getCurrencyConverterRequestState,  CurrencyConverterResponseModel? currencyConverterData,  CountryModel? sourceCountry,  CountryModel? targetCountry,  double exchangeRate,  double convertedAmount,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CurrencyConverterState() when $default != null:
return $default(_that.getCurrencyConverterRequestState,_that.currencyConverterData,_that.sourceCountry,_that.targetCountry,_that.exchangeRate,_that.convertedAmount,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RequestState getCurrencyConverterRequestState,  CurrencyConverterResponseModel? currencyConverterData,  CountryModel? sourceCountry,  CountryModel? targetCountry,  double exchangeRate,  double convertedAmount,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _CurrencyConverterState():
return $default(_that.getCurrencyConverterRequestState,_that.currencyConverterData,_that.sourceCountry,_that.targetCountry,_that.exchangeRate,_that.convertedAmount,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RequestState getCurrencyConverterRequestState,  CurrencyConverterResponseModel? currencyConverterData,  CountryModel? sourceCountry,  CountryModel? targetCountry,  double exchangeRate,  double convertedAmount,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _CurrencyConverterState() when $default != null:
return $default(_that.getCurrencyConverterRequestState,_that.currencyConverterData,_that.sourceCountry,_that.targetCountry,_that.exchangeRate,_that.convertedAmount,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _CurrencyConverterState implements CurrencyConverterState {
  const _CurrencyConverterState({this.getCurrencyConverterRequestState = RequestState.initial, this.currencyConverterData = null, this.sourceCountry = null, this.targetCountry = const CountryModel(alpha3: "USA", currencyId: "USD", currencyName: "United States dollar", currencySymbol: "\$", id: "US", name: "United States of America"), this.exchangeRate = 0.0, this.convertedAmount = 0.0, this.errorMessage = null});
  

// get currencies request state
@override@JsonKey() final  RequestState getCurrencyConverterRequestState;
// currency converter data
@override@JsonKey() final  CurrencyConverterResponseModel? currencyConverterData;
// source currency
@override@JsonKey() final  CountryModel? sourceCountry;
// target country
@override@JsonKey() final  CountryModel? targetCountry;
// exchange rate
@override@JsonKey() final  double exchangeRate;
// converted amount
@override@JsonKey() final  double convertedAmount;
// error message
@override@JsonKey() final  String? errorMessage;

/// Create a copy of CurrencyConverterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrencyConverterStateCopyWith<_CurrencyConverterState> get copyWith => __$CurrencyConverterStateCopyWithImpl<_CurrencyConverterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrencyConverterState&&(identical(other.getCurrencyConverterRequestState, getCurrencyConverterRequestState) || other.getCurrencyConverterRequestState == getCurrencyConverterRequestState)&&(identical(other.currencyConverterData, currencyConverterData) || other.currencyConverterData == currencyConverterData)&&(identical(other.sourceCountry, sourceCountry) || other.sourceCountry == sourceCountry)&&(identical(other.targetCountry, targetCountry) || other.targetCountry == targetCountry)&&(identical(other.exchangeRate, exchangeRate) || other.exchangeRate == exchangeRate)&&(identical(other.convertedAmount, convertedAmount) || other.convertedAmount == convertedAmount)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,getCurrencyConverterRequestState,currencyConverterData,sourceCountry,targetCountry,exchangeRate,convertedAmount,errorMessage);

@override
String toString() {
  return 'CurrencyConverterState(getCurrencyConverterRequestState: $getCurrencyConverterRequestState, currencyConverterData: $currencyConverterData, sourceCountry: $sourceCountry, targetCountry: $targetCountry, exchangeRate: $exchangeRate, convertedAmount: $convertedAmount, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$CurrencyConverterStateCopyWith<$Res> implements $CurrencyConverterStateCopyWith<$Res> {
  factory _$CurrencyConverterStateCopyWith(_CurrencyConverterState value, $Res Function(_CurrencyConverterState) _then) = __$CurrencyConverterStateCopyWithImpl;
@override @useResult
$Res call({
 RequestState getCurrencyConverterRequestState, CurrencyConverterResponseModel? currencyConverterData, CountryModel? sourceCountry, CountryModel? targetCountry, double exchangeRate, double convertedAmount, String? errorMessage
});




}
/// @nodoc
class __$CurrencyConverterStateCopyWithImpl<$Res>
    implements _$CurrencyConverterStateCopyWith<$Res> {
  __$CurrencyConverterStateCopyWithImpl(this._self, this._then);

  final _CurrencyConverterState _self;
  final $Res Function(_CurrencyConverterState) _then;

/// Create a copy of CurrencyConverterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? getCurrencyConverterRequestState = null,Object? currencyConverterData = freezed,Object? sourceCountry = freezed,Object? targetCountry = freezed,Object? exchangeRate = null,Object? convertedAmount = null,Object? errorMessage = freezed,}) {
  return _then(_CurrencyConverterState(
getCurrencyConverterRequestState: null == getCurrencyConverterRequestState ? _self.getCurrencyConverterRequestState : getCurrencyConverterRequestState // ignore: cast_nullable_to_non_nullable
as RequestState,currencyConverterData: freezed == currencyConverterData ? _self.currencyConverterData : currencyConverterData // ignore: cast_nullable_to_non_nullable
as CurrencyConverterResponseModel?,sourceCountry: freezed == sourceCountry ? _self.sourceCountry : sourceCountry // ignore: cast_nullable_to_non_nullable
as CountryModel?,targetCountry: freezed == targetCountry ? _self.targetCountry : targetCountry // ignore: cast_nullable_to_non_nullable
as CountryModel?,exchangeRate: null == exchangeRate ? _self.exchangeRate : exchangeRate // ignore: cast_nullable_to_non_nullable
as double,convertedAmount: null == convertedAmount ? _self.convertedAmount : convertedAmount // ignore: cast_nullable_to_non_nullable
as double,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
