// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable {
  CryptoCoin({
    required this.name,
    required this.priceInUSD,
    required this.imageURL,
  });

  final String name;
  final double priceInUSD;
  final String imageURL;

  @override
  List<Object> get props => [name, priceInUSD, imageURL];
}
