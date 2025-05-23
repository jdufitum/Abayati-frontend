part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

final class AllProductEvent extends ProductEvent {}

final class WishlistEvent extends ProductEvent {}

final class CategoryEvent extends ProductEvent {}

final class CartEvent extends ProductEvent {}

final class StoresEvent extends ProductEvent {}

final class OrdersEvent extends ProductEvent {}

final class PaymentsEvent extends ProductEvent {
  final String orderId;

  PaymentsEvent({required this.orderId});
}

final class StoresByCategoryEvent extends ProductEvent {
  final String id;

  StoresByCategoryEvent({required this.id});
}

final class RemoveFromWishlistEvent extends ProductEvent {
  final WishlistDto wishlistDto;

  RemoveFromWishlistEvent({required this.wishlistDto});
}

final class RemoveFromCartEvent extends ProductEvent {
  final WishlistDto wishlistDto;

  RemoveFromCartEvent({required this.wishlistDto});
}

final class AddToWishlistEvent extends ProductEvent {
  final WishlistDto wishlistDto;

  AddToWishlistEvent({required this.wishlistDto});
}

final class AddToCartEvent extends ProductEvent {
  final WishlistDto wishlistDto;

  AddToCartEvent({required this.wishlistDto});
}
