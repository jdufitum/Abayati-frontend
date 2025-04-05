part of 'product_bloc.dart';

@immutable
sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class StoresLoading extends ProductState {}

final class OrdersLoading extends ProductState {}


final class PaymentsLoading extends ProductState {}

final class AllProductSuccess extends ProductState {
  final List<Product> allProducts;

  const AllProductSuccess({required this.allProducts});
}

final class AllProductError extends ProductState {
  final String error;

  const AllProductError({required this.error});
}

final class CategorySuccess extends ProductState {
  final List<Category> category;

  const CategorySuccess({required this.category});
}

final class CategoryError extends ProductState {
  final String error;

  const CategoryError({required this.error});
}

final class PaymentSuccess extends ProductState {}

final class PaymentError extends ProductState {
  final String error;

  const PaymentError({required this.error});
}

final class OrderSuccess extends ProductState {
  final Orders orders;

  const OrderSuccess({required this.orders});
}

final class OrderError extends ProductState {
  final String error;

  const OrderError({required this.error});
}

final class CartSuccess extends ProductState {
  final List<Cart> cart;

  const CartSuccess({required this.cart});
}

final class CartError extends ProductState {
  final String error;

  const CartError({required this.error});
}

final class StoreSuccess extends ProductState {
  final List<ProductStore> stores;

  const StoreSuccess({required this.stores});
}

final class StoreError extends ProductState {
  final String error;

  const StoreError({required this.error});
}

final class StoreByCategorySuccess extends ProductState {
  final List<ProductStore> stores;

  const StoreByCategorySuccess({required this.stores});
}

final class StoreByCategoryError extends ProductState {
  final String error;

  const StoreByCategoryError({required this.error});
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

final class AddToCartSuccess extends ProductState {
  final String message;

  const AddToCartSuccess({required this.message});
}

final class AddToCartError extends ProductState {
  final String error;

  const AddToCartError({required this.error});
}

final class RemoveFromWishlistSuccess extends ProductState {}

final class RemoveFromWishlistError extends ProductState {
  final String error;

  const RemoveFromWishlistError({required this.error});
}

final class RemoveFromCartSuccess extends ProductState {}

final class RemoveFromCartError extends ProductState {
  final String error;

  const RemoveFromCartError({required this.error});
}
