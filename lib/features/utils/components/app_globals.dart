import 'package:abayati/features/core/model/response/auth.dart';
import 'package:abayati/features/core/model/response/product.dart';
import 'package:abayati/features/core/services/service/auth/bloc/auth_bloc.dart';
import 'package:abayati/features/core/services/service/product/bloc/product_bloc.dart';
import 'package:abayati/features/screens/onboard/dashboard/nav/wishlist/state/wishlist_cubit.dart';
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
  User? user;

  List<Product>? allProducts;
  List<Product>? wishlist;
  List<Category>? category;
  List<Cart>? cart;

  AuthBloc? authBloc;
  ProductBloc? productBloc;

  WishlistCubit? wishlistCubit;

  Future<void> init() async {
    if (sharedPreferences == null) {
      localStorage = LocalStorage(
          // flutterSecureStorage: _flutterSecureStorage =
          //     const FlutterSecureStorage(),
          sharedPreferences: sharedPreferences =
              await SharedPreferences.getInstance());
    }

    token = '';
    user = User();
    allProducts = [];
    wishlist = [];
    category = [];
    cart = [];

    authBloc = AuthBloc();
    productBloc = ProductBloc();

    wishlistCubit = WishlistCubit();
  }

  Future<void> dispose() async {
    token = null;
    user = null;
    allProducts = null;
    wishlist = null;
    category = null;
    cart = null;

    sharedPreferences?.clear();
  }
}

AppGlobals globals = getIt.get<AppGlobals>();

Future<void> initSingletons() async {
  getIt.registerLazySingleton<AppGlobals>(() => AppGlobals());

  await dotenv.load();
  await globals.init();
}
