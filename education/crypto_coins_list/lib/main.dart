import 'dart:async';

import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:crypto_coins_list/crypto_coins_list_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      final talker = TalkerFlutter.init();
      talker.debug('Talker start...');
      GetIt.I.registerSingleton(talker);

      const cryptoCoinsBoxName = 'crypto_coins_box';
      await Hive.initFlutter();
      Hive.registerAdapter(CryptoCoinAdapter());
      Hive.registerAdapter(CryptoCoinDetailAdapter());
      final cryptoCoinsBox = await Hive.openBox<CryptoCoin>(cryptoCoinsBoxName);

      Dio dio = Dio();
      dio.interceptors.add(
        TalkerDioLogger(
          talker: talker,
          settings: const TalkerDioLoggerSettings(
            printResponseData: false,
          ),
        ),
      );
      GetIt.I.registerLazySingleton<AbstractCoinsRepository>(() =>
          CryptoCoinsRepository(dio: dio, cryptoCoinsBox: cryptoCoinsBox));

      Bloc.observer = TalkerBlocObserver(
        talker: talker,
        settings: const TalkerBlocLoggerSettings(
          printEventFullData: false,
          printStateFullData: false,
        ),
      );

      FlutterError.onError = (details) =>
          GetIt.I<Talker>().handle(details.exception, details.stack);

      runApp(const CryptoCurrenciesListApp());
    },
    (error, stack) {
      GetIt.I<Talker>().handle(error, stack);
    },
  );
}
