import 'package:abayati/features/core/model/response/product.dart';
import 'package:abayati/features/core/services/service/ai/datasource.dart';
import 'package:dartz/dartz.dart';

class AIRepository {
  final _datasource = AIDatasource();

  Future<Either<String, List<Product>>> search(String query) async {
    final output = await _datasource.search(query);
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
