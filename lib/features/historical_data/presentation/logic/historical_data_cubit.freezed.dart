// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'historical_data_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HistoricalDataState {

// get currencies request state
 RequestState get getHistoricalDataRequestState;// historical data
 HistoricalDataResponseModel? get historicalData;// error message
 String? get errorMessage;
/// Create a copy of HistoricalDataState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoricalDataStateCopyWith<HistoricalDataState> get copyWith => _$HistoricalDataStateCopyWithImpl<HistoricalDataState>(this as HistoricalDataState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoricalDataState&&(identical(other.getHistoricalDataRequestState, getHistoricalDataRequestState) || other.getHistoricalDataRequestState == getHistoricalDataRequestState)&&(identical(other.historicalData, historicalData) || other.historicalData == historicalData)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,getHistoricalDataRequestState,historicalData,errorMessage);

@override
String toString() {
  return 'HistoricalDataState(getHistoricalDataRequestState: $getHistoricalDataRequestState, historicalData: $historicalData, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $HistoricalDataStateCopyWith<$Res>  {
  factory $HistoricalDataStateCopyWith(HistoricalDataState value, $Res Function(HistoricalDataState) _then) = _$HistoricalDataStateCopyWithImpl;
@useResult
$Res call({
 RequestState getHistoricalDataRequestState, HistoricalDataResponseModel? historicalData, String? errorMessage
});




}
/// @nodoc
class _$HistoricalDataStateCopyWithImpl<$Res>
    implements $HistoricalDataStateCopyWith<$Res> {
  _$HistoricalDataStateCopyWithImpl(this._self, this._then);

  final HistoricalDataState _self;
  final $Res Function(HistoricalDataState) _then;

/// Create a copy of HistoricalDataState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? getHistoricalDataRequestState = null,Object? historicalData = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
getHistoricalDataRequestState: null == getHistoricalDataRequestState ? _self.getHistoricalDataRequestState : getHistoricalDataRequestState // ignore: cast_nullable_to_non_nullable
as RequestState,historicalData: freezed == historicalData ? _self.historicalData : historicalData // ignore: cast_nullable_to_non_nullable
as HistoricalDataResponseModel?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoricalDataState].
extension HistoricalDataStatePatterns on HistoricalDataState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoricalDataState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoricalDataState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoricalDataState value)  $default,){
final _that = this;
switch (_that) {
case _HistoricalDataState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoricalDataState value)?  $default,){
final _that = this;
switch (_that) {
case _HistoricalDataState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RequestState getHistoricalDataRequestState,  HistoricalDataResponseModel? historicalData,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoricalDataState() when $default != null:
return $default(_that.getHistoricalDataRequestState,_that.historicalData,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RequestState getHistoricalDataRequestState,  HistoricalDataResponseModel? historicalData,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _HistoricalDataState():
return $default(_that.getHistoricalDataRequestState,_that.historicalData,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RequestState getHistoricalDataRequestState,  HistoricalDataResponseModel? historicalData,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _HistoricalDataState() when $default != null:
return $default(_that.getHistoricalDataRequestState,_that.historicalData,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _HistoricalDataState implements HistoricalDataState {
  const _HistoricalDataState({this.getHistoricalDataRequestState = RequestState.initial, this.historicalData = null, this.errorMessage = null});
  

// get currencies request state
@override@JsonKey() final  RequestState getHistoricalDataRequestState;
// historical data
@override@JsonKey() final  HistoricalDataResponseModel? historicalData;
// error message
@override@JsonKey() final  String? errorMessage;

/// Create a copy of HistoricalDataState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoricalDataStateCopyWith<_HistoricalDataState> get copyWith => __$HistoricalDataStateCopyWithImpl<_HistoricalDataState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoricalDataState&&(identical(other.getHistoricalDataRequestState, getHistoricalDataRequestState) || other.getHistoricalDataRequestState == getHistoricalDataRequestState)&&(identical(other.historicalData, historicalData) || other.historicalData == historicalData)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,getHistoricalDataRequestState,historicalData,errorMessage);

@override
String toString() {
  return 'HistoricalDataState(getHistoricalDataRequestState: $getHistoricalDataRequestState, historicalData: $historicalData, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$HistoricalDataStateCopyWith<$Res> implements $HistoricalDataStateCopyWith<$Res> {
  factory _$HistoricalDataStateCopyWith(_HistoricalDataState value, $Res Function(_HistoricalDataState) _then) = __$HistoricalDataStateCopyWithImpl;
@override @useResult
$Res call({
 RequestState getHistoricalDataRequestState, HistoricalDataResponseModel? historicalData, String? errorMessage
});




}
/// @nodoc
class __$HistoricalDataStateCopyWithImpl<$Res>
    implements _$HistoricalDataStateCopyWith<$Res> {
  __$HistoricalDataStateCopyWithImpl(this._self, this._then);

  final _HistoricalDataState _self;
  final $Res Function(_HistoricalDataState) _then;

/// Create a copy of HistoricalDataState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? getHistoricalDataRequestState = null,Object? historicalData = freezed,Object? errorMessage = freezed,}) {
  return _then(_HistoricalDataState(
getHistoricalDataRequestState: null == getHistoricalDataRequestState ? _self.getHistoricalDataRequestState : getHistoricalDataRequestState // ignore: cast_nullable_to_non_nullable
as RequestState,historicalData: freezed == historicalData ? _self.historicalData : historicalData // ignore: cast_nullable_to_non_nullable
as HistoricalDataResponseModel?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
