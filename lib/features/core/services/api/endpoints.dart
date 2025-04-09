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

  static String get orders => 'orders';

  static String get payments => 'payments';

  static String get removeFromWishlist => 'removeFromWishlist';

  static String get createMeasurements => 'user/createMeasurements';

  static String get getMeasurement => 'user/getMeasurement';

  static String get virtualTryon => 'user/virtualTryon';
}
