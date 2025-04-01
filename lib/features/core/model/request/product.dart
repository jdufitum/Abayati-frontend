import 'package:abayati/features/utils/components/app_globals.dart';

class WishlistDto {
  // final String userId;
  final String productId;
  final String? quantity;

  WishlistDto({
    // required this.userId,
    required this.productId,
    this.quantity,
  });

  Map<String, dynamic> toJson() => {
        "userId": globals.user!.id,
        "productId": productId,
        "quantity": quantity,
      }..removeWhere((key, value) => value == null);
}
