import 'package:currencyx/app.dart';
import 'package:currencyx/data/CurrencyRepositoryImpl.dart';
import 'package:currencyx/domain/ApiService.dart';
import 'package:currencyx/domain/CurrencyRepository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "secrets.env");
  configureDependencies();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

void configureDependencies() {
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio(
      BaseOptions(
        baseUrl: dotenv.env['BASE_URL'] ?? "",
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
      ),
    );
    dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestBody: true,
        requestHeader: false,
        responseHeader: false,
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.queryParameters['apikey'] = dotenv.env['API_KEY']!;
          return handler.next(options);
        },
      ),
    );
    return dio;
  });
  getIt.registerSingleton<ApiService>(ApiService(getIt<Dio>()));
  getIt.registerLazySingleton<CurrencyRepository>(
    () => CurrencyRepositoryImpl(apiService: getIt<ApiService>()),
  );
}
