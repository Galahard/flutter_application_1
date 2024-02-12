import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/coins_list/widgets/widgets.dart';
import 'package:flutter_application_1/repositories/crypto_coins/crypto_list_reposit.dart';

import '../../../repositories/crypto_coins/models/crypto_coin.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinsList;
  @override
  void initState() {
    _loadCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text('CryptoCoinList'),
      ),
      body: (_cryptoCoinsList == null)
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
            padding: const EdgeInsets.only(top: 16),
              itemCount: _cryptoCoinsList!.length,
              separatorBuilder: (context, i) => const Divider(),
              itemBuilder: (context, i) {
                final coin = _cryptoCoinsList![i];

                return CryptoCoinsTile(coin: coin);
              }),
      
    );
  }

  Future<void> _loadCryptoCoins() async {
     _cryptoCoinsList = await CryptoCoinsReposit().getCoinsList();
    setState(() {});
  }
}
