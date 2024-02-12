import 'package:dio/dio.dart';

import 'package:flutter_application_1/repositories/crypto_coins/models/crypto_coin.dart';

class CryptoCoinsReposit {
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await Dio().get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,AVAX,AID,SOL,XRP,ABYSS,LINK&tsyms=USD');
    
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String,dynamic>;
    final cryptoCoinsList = dataRaw.entries.map((e){
      final usdData=(e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final price = usdData['PRICE'];
      final imageURL = usdData['IMAGEURL'];
     return CryptoCoin(
      
      name: e.key, 
      priceInUSD: price,
      imageURL: 'https://www.cryptocompare.com/$imageURL',
      );}).toList();
return cryptoCoinsList;

  }
}
