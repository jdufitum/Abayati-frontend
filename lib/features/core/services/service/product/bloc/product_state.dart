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
