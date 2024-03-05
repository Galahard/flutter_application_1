import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin_details.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class CryptoCoinDetail extends Equatable {
  const CryptoCoinDetail({
    required this.priceInUSD,
    required this.imageURL,
    required this.toSymbol,
    required this.lastUpdate,
    required this.hight24Hour,
    required this.low24Hours,
  });

  @HiveField(0)
  @JsonKey(name: 'TOSYMBOL')
  final String toSymbol;

  @HiveField(1)
  @JsonKey(
    name: 'LASTUPDATE',
    toJson: _dateTimeToJson,
    fromJson: _dateTimeTFromJson,
  )
  final DateTime lastUpdate;

  @HiveField(2)
  @JsonKey(name: 'HIGH24HOUR')
  final double hight24Hour;

  @HiveField(3)
  @JsonKey(name: 'LOW24HOUR')
  final double low24Hours;

  @HiveField(4)
  @JsonKey(name: 'PRICE')
  final double priceInUSD;

  @HiveField(5)
  @JsonKey(name: 'IMAGEURL')
  final String imageURL;

  String get fullImageUrl => 'http://www.cryptocompare.com/$imageURL';

  factory CryptoCoinDetail.fromJson(Map<String, dynamic> json) =>
      _$CryptoCoinDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoCoinDetailToJson(this);

  static int _dateTimeToJson(DateTime time) => time.millisecondsSinceEpoch;

  static DateTime _dateTimeTFromJson(int milloseconds) =>
      DateTime.fromMillisecondsSinceEpoch(milloseconds);

  @override
  List<Object> get props =>
      [toSymbol, lastUpdate, hight24Hour, low24Hours, priceInUSD, imageURL];
}
