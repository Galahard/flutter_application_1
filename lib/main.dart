import 'dart:async';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/crypto_coin_list_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'firebase_options.dart';
import 'repositories/crypto_coins/crypto_coin.dart';




void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().debug('Talker started');

  const cryptoCoinsBoxName='crypto_coins_box';

  await Hive.initFlutter();

  Hive.registerAdapter(CryptoCoinAdapter());
  Hive.registerAdapter(CryptoCoinDetailAdapter());

  final cryptoCoinsBox = await Hive.openBox<CryptoCoin>( cryptoCoinsBoxName);

  final dio = Dio();
  dio.interceptors.add(
    TalkerDioLogger(
        talker: talker,
        settings: const TalkerDioLoggerSettings(printResponseData: false)),
  );

  Bloc.observer = TalkerBlocObserver(
      talker: talker,
      settings: const TalkerBlocLoggerSettings(
          printStateFullData: false, printEventFullData: false));

  GetIt.I
      .registerLazySingleton<AbstractCoinsRepository>(() => CryptoCoinsReposit(
            dio: dio,
            cryptoCoinsBox: cryptoCoinsBox,
          ));

  FlutterError.onError =
      (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

  runZonedGuarded(
    () => runApp(const CryptoCoinList()),
    (error, stack) => GetIt.I<Talker>().handle(error, stack),
  );
}
