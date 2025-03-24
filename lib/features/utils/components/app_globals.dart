import 'package:abayati/features/core/services/service/auth/bloc/auth_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/db/storage.dart';

final GetIt getIt = GetIt.instance;

class AppGlobals {
  factory AppGlobals() => instance;

  AppGlobals._();

  static final AppGlobals instance = AppGlobals._();

  // late final FlutterSecureStorage _flutterSecureStorage;
  SharedPreferences? sharedPreferences;
  late final LocalStorage localStorage;
  String? token;

  AuthBloc? authBloc;

  Future<void> init() async {
    if (sharedPreferences == null) {
      localStorage = LocalStorage(
          // flutterSecureStorage: _flutterSecureStorage =
          //     const FlutterSecureStorage(),
          sharedPreferences: sharedPreferences =
              await SharedPreferences.getInstance());
    }

    token = '';
    authBloc = AuthBloc();
  }

  Future<void> dispose() async {
    token = null;

    sharedPreferences?.clear();
  }
}

AppGlobals globals = getIt.get<AppGlobals>();

Future<void> initSingletons() async {
  getIt.registerLazySingleton<AppGlobals>(() => AppGlobals());

  await dotenv.load();
  await globals.init();
}
