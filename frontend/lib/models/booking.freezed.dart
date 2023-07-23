// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Booking {
  String get tenantAddress => throw _privateConstructorUsedError;
  String get contractAddress => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  DateTime get start => throw _privateConstructorUsedError;
  DateTime get end => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookingCopyWith<Booking> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingCopyWith<$Res> {
  factory $BookingCopyWith(Booking value, $Res Function(Booking) then) =
      _$BookingCopyWithImpl<$Res, Booking>;
  @useResult
  $Res call(
      {String tenantAddress,
      String contractAddress,
      double amount,
      DateTime start,
      DateTime end});
}

/// @nodoc
class _$BookingCopyWithImpl<$Res, $Val extends Booking>
    implements $BookingCopyWith<$Res> {
  _$BookingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenantAddress = null,
    Object? contractAddress = null,
    Object? amount = null,
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_value.copyWith(
      tenantAddress: null == tenantAddress
          ? _value.tenantAddress
          : tenantAddress // ignore: cast_nullable_to_non_nullable
              as String,
      contractAddress: null == contractAddress
          ? _value.contractAddress
          : contractAddress // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookingCopyWith<$Res> implements $BookingCopyWith<$Res> {
  factory _$$_BookingCopyWith(
          _$_Booking value, $Res Function(_$_Booking) then) =
      __$$_BookingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String tenantAddress,
      String contractAddress,
      double amount,
      DateTime start,
      DateTime end});
}

/// @nodoc
class __$$_BookingCopyWithImpl<$Res>
    extends _$BookingCopyWithImpl<$Res, _$_Booking>
    implements _$$_BookingCopyWith<$Res> {
  __$$_BookingCopyWithImpl(_$_Booking _value, $Res Function(_$_Booking) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenantAddress = null,
    Object? contractAddress = null,
    Object? amount = null,
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_$_Booking(
      tenantAddress: null == tenantAddress
          ? _value.tenantAddress
          : tenantAddress // ignore: cast_nullable_to_non_nullable
              as String,
      contractAddress: null == contractAddress
          ? _value.contractAddress
          : contractAddress // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_Booking implements _Booking {
  const _$_Booking(
      {required this.tenantAddress,
      required this.contractAddress,
      required this.amount,
      required this.start,
      required this.end});

  @override
  final String tenantAddress;
  @override
  final String contractAddress;
  @override
  final double amount;
  @override
  final DateTime start;
  @override
  final DateTime end;

  @override
  String toString() {
    return 'Booking(tenantAddress: $tenantAddress, contractAddress: $contractAddress, amount: $amount, start: $start, end: $end)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Booking &&
            (identical(other.tenantAddress, tenantAddress) ||
                other.tenantAddress == tenantAddress) &&
            (identical(other.contractAddress, contractAddress) ||
                other.contractAddress == contractAddress) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, tenantAddress, contractAddress, amount, start, end);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookingCopyWith<_$_Booking> get copyWith =>
      __$$_BookingCopyWithImpl<_$_Booking>(this, _$identity);
}

abstract class _Booking implements Booking {
  const factory _Booking(
      {required final String tenantAddress,
      required final String contractAddress,
      required final double amount,
      required final DateTime start,
      required final DateTime end}) = _$_Booking;

  @override
  String get tenantAddress;
  @override
  String get contractAddress;
  @override
  double get amount;
  @override
  DateTime get start;
  @override
  DateTime get end;
  @override
  @JsonKey(ignore: true)
  _$$_BookingCopyWith<_$_Booking> get copyWith =>
      throw _privateConstructorUsedError;
}
