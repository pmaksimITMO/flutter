import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin_details.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class CryptoCoinDetail extends Equatable {
  @HiveField(0)
  @JsonKey(name: 'PRICE')
  final double priceInUSD;

  @HiveField(1)
  @JsonKey(name: 'IMAGEURL')
  final String imageUrl;

  @HiveField(2)
  @JsonKey(name: 'TOSYMBOL')
  final String toSymbol;

  @HiveField(3)
  @JsonKey(
    name: 'LASTUPDATE',
    toJson: _dateTimeToJson,
    fromJson: _dateTimeFromJson,
  )
  final DateTime lastUpdate;

  @HiveField(4)
  @JsonKey(name: 'HIGH24HOUR')
  final double hight24Hours;

  @HiveField(5)
  @JsonKey(name: 'LOW24HOUR')
  final double low24Hours;

  const CryptoCoinDetail(
      {required this.priceInUSD,
      required this.imageUrl,
      required this.toSymbol,
      required this.lastUpdate,
      required this.hight24Hours,
      required this.low24Hours});

  factory CryptoCoinDetail.fromJson(Map<String, dynamic> json) =>
      _$CryptoCoinDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoCoinDetailToJson(this);

  static int _dateTimeToJson(DateTime time) => time.millisecondsSinceEpoch;

  static DateTime _dateTimeFromJson(int milliseconds) =>
      DateTime.fromMicrosecondsSinceEpoch(milliseconds);

  String get fullImageUrl => 'https://www.cryptocompare.com/$imageUrl';

  @override
  List<Object?> get props =>
      [priceInUSD, imageUrl, toSymbol, lastUpdate, hight24Hours, low24Hours];
}
