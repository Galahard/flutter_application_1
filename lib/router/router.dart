import 'package:flutter_application_1/features/coins_list/coins_list.dart';
import 'package:flutter_application_1/features/crypto_coin/crypto_coin.dart';

final routes={
        '/': (context) => const CryptoListScreen(),
        '/coin': (context) => const CryptoCoinScreen(),
      };