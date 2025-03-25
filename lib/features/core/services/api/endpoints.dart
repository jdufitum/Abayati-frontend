import 'package:abayati/features/core/services/api/env.dart';

class Endpoints {
  static String get baseUrl => Env.baseUrl;

  static String get login => 'login';

  static String get register => 'register';

  static String get products => 'products';

  static String get wishlist => 'wishlist';

  static String get addToWishlist => 'addToWishlist';

  static String get removeFromWishlist => 'removeFromWishlist';
}
