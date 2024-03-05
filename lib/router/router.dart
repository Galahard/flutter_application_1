import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/coins_list/coins_list.dart';
import 'package:flutter_application_1/features/crypto_coin/crypto_coin.dart';
import 'package:flutter_application_1/repositories/crypto_coins/crypto_coin.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
      AutoRoute(page: CryptoListRoute.page, path: '/' ),
      AutoRoute(page: CryptoCoinRoute.page),
      ];
}
