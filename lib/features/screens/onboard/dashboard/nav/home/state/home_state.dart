part of 'home_cubit.dart';

class HomeState extends Equatable {
  final List<Product> allProducts;
  final String query;

  const HomeState({this.allProducts = const [], this.query = ''});

  List<Product> get filteredProduct => allProducts
      .where((product) =>
          product.name!.toLowerCase().contains(query.toLowerCase()) ||
          product.description!.toLowerCase().contains(query.toLowerCase()) ||
          product.price.toString().toLowerCase().contains(query.toLowerCase()))
      .toList();

  HomeState copyWith({List<Product>? allProducts, String? query}) => HomeState(
      allProducts: allProducts ?? this.allProducts, query: query ?? this.query);

  @override
  List<Object?> get props => [allProducts, query];
}
