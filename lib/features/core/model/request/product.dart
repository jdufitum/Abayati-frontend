import 'package:abayati/features/utils/components/app_globals.dart';

class WishlistDto {
  // final String userId;
  final String productId;

  WishlistDto({
    // required this.userId,
    required this.productId,
  });

  Map<String, dynamic> toJson() => {
        "userId": globals.user!.id,
        "productId": productId,
      };
}
