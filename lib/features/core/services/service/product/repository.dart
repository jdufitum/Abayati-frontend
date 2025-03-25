import 'package:abayati/features/core/model/response/product.dart';
import 'package:abayati/features/core/services/service/product/datasource.dart';
import 'package:dartz/dartz.dart';

class ProductRepository {
  final _datasource = ProductDatasource();

  Future<Either<String, List<Product>>> allProduct() async {
    final output = await _datasource.allProducts();
    if (output.error != null) {
      return Left(output.message!);
    } else {
      final products = (output.data as List)
          .map((product) => Product.fromJson(product))
          .toList();
      return Right(products);
    }
  }
}
