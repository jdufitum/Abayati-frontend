part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

final class AllProductEvent extends ProductEvent {}

final class WishlistEvent extends ProductEvent {}

final class RemoveFromWishlistEvent extends ProductEvent {
  final WishlistDto wishlistDto;

  RemoveFromWishlistEvent({required this.wishlistDto});
}

final class AddToWishlistEvent extends ProductEvent {
  final WishlistDto wishlistDto;

  AddToWishlistEvent({required this.wishlistDto});
}
