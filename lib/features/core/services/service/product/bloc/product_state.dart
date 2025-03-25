part of 'product_bloc.dart';

@immutable
sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class AllProductSuccess extends ProductState {
  final List<Product> allProducts;

  const AllProductSuccess({required this.allProducts});
}

final class AllProductError extends ProductState {
  final String error;

  const AllProductError({required this.error});
}

final class WishlistLoading extends ProductState {}

final class WishlistSuccess extends ProductState {
  final List<Product> wishlist;

  const WishlistSuccess({required this.wishlist});
}

final class WishlistError extends ProductState {
  final String error;

  const WishlistError({required this.error});
}

final class AddToWishlistSuccess extends ProductState {}

final class AddToWishlistError extends ProductState {
  final String error;

  const AddToWishlistError({required this.error});
}

final class RemoveFromWishlistSuccess extends ProductState {}

final class RemoveFromWishlistError extends ProductState {
  final String error;

  const RemoveFromWishlistError({required this.error});
}
