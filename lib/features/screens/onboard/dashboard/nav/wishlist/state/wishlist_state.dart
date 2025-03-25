part of 'wishlist_cubit.dart';

class WishlistState extends Equatable {
  final Set<Product> favoriteProduct;

  const WishlistState({this.favoriteProduct = const {}});

  WishlistState copyWith({Set<Product>? favoriteProduct}) =>
      WishlistState(favoriteProduct: favoriteProduct ?? this.favoriteProduct);

  @override
  List<Object?> get props => [favoriteProduct];
}
