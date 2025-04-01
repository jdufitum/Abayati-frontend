part of 'wishlist_cubit.dart';

class WishlistState extends Equatable {
  final Set<String> favoriteProduct;
  final List<Product> wishlist;
  final List<Product> cart;

  const WishlistState(
      {this.favoriteProduct = const {},
      this.wishlist = const [],
      this.cart = const []});

  WishlistState copyWith(
          {Set<String>? favoriteProduct,
          List<Product>? wishlist,
          List<Product>? cart}) =>
      WishlistState(
        favoriteProduct: favoriteProduct ?? this.favoriteProduct,
        wishlist: wishlist ?? this.wishlist,
        cart: cart ?? this.cart,
      );

  @override
  List<Object?> get props => [favoriteProduct, wishlist, cart];
}
