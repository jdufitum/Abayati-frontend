part of 'wishlist_cubit.dart';

class WishlistState extends Equatable {
  final Set<String> favoriteProduct;
  final List<Product> wishlist;

  const WishlistState(
      {this.favoriteProduct = const {}, this.wishlist = const []});

  WishlistState copyWith(
          {Set<String>? favoriteProduct, List<Product>? wishlist}) =>
      WishlistState(
          favoriteProduct: favoriteProduct ?? this.favoriteProduct,
          wishlist: wishlist ?? this.wishlist);

  @override
  List<Object?> get props => [favoriteProduct, wishlist];
}
