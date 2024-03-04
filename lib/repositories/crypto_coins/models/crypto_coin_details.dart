import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin_details.g.dart';

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

  @JsonKey(name: 'TOSYMBOL')
  final String toSymbol;

  @JsonKey(
    name: 'LASTUPDATE',
    toJson: _dateTimeToJson,
    fromJson: _dateTimeTFromJson,
  )
  final DateTime lastUpdate;

  @JsonKey(name: 'HIGH24HOUR')
  final double hight24Hour;

  @JsonKey(name: 'LOW24HOUR')
  final double low24Hours;

  @JsonKey(name: 'PRICE')
  final double priceInUSD;

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
