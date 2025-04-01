import 'package:abayati/features/core/model/request/product.dart';
import 'package:abayati/features/core/model/response/abstract_response.dart';
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

  Future<Either<String, List<Product>>> wishlist() async {
    final output = await _datasource.wishlist();
    if (output.error != null) {
      return Left(output.message!);
    } else {
      final wishlist = (output.data as List)
          .map((product) => Product.fromJson(product))
          .toList();
      return Right(wishlist);
    }
  }

  Future<Either<String, List<Cart>>> cart() async {
    final output = await _datasource.cart();
    if (output.error != null) {
      return Left(output.message!);
    } else {
      final cart = (output.data as List)
          .map((product) => Cart.fromJson(product))
          .toList();
      return Right(cart);
    }
  }

  Future<Either<String, List<Category>>> category() async {
    final output = await _datasource.category();
    if (output.error != null) {
      return Left(output.message!);
    } else {
      final category = (output.data as List)
          .map((product) => Category.fromJson(product))
          .toList();
      return Right(category);
    }
  }

  Future<Either<String, AbstractResponse>> addToWishlist(
      WishlistDto wishlistDto) async {
    final output = await _datasource.addToWishlist(wishlistDto);
    if (output.error != null) {
      return Left(output.message!);
    } else {
      return Right(output);
    }
  }

  Future<Either<String, AbstractResponse>> addToCart(
      WishlistDto wishlistDto) async {
    final output = await _datasource.addToCart(wishlistDto);
    if (output.error != null) {
      return Left(output.message!);
    } else {
      return Right(output);
    }
  }

  Future<Either<String, AbstractResponse>> removeFromWishlist(
      WishlistDto wishlistDto) async {
    final output = await _datasource.removeFromWishlist(wishlistDto);
    if (output.error != null) {
      return Left(output.message!);
    } else {
      return Right(output);
    }
  }

  Future<Either<String, AbstractResponse>> removeFromCart(
      WishlistDto wishlistDto) async {
    final output = await _datasource.removeFromCart(wishlistDto);
    if (output.error != null) {
      return Left(output.message!);
    } else {
      return Right(output);
    }
  }
}
