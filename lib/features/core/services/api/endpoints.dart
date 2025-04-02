import 'package:abayati/features/core/services/api/env.dart';

class Endpoints {
  static String get baseUrl => Env.baseUrl;

  static String get login => 'login';

  static String get register => 'register';

  static String get products => 'products';

  static String get wishlist => 'wishlist';

  static String get category => 'categories';

  static String get addToWishlist => 'addToWishlist';

  static String get addToCart => 'addToCart';

  static String get removeFromCart => 'removeFromCart';

  static String get cart => 'cart';

  static String get stores => 'stores';

  static String storesByCategory(String id) => 'getStoresByCategory/$id';

  static String get search => 'search';

  static String get removeFromWishlist => 'removeFromWishlist';
}
