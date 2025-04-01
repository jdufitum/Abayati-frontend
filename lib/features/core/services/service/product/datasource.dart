import 'package:abayati/features/core/model/request/product.dart';
import 'package:abayati/features/core/model/response/abstract_response.dart';
import 'package:abayati/features/core/services/api/api_client.dart';
import 'package:abayati/features/core/services/api/endpoints.dart';

class ProductDatasource {
  final _client = ApiClient();

  Future<AbstractResponse> allProducts() async {
    try {
      final response = await _client.get(Endpoints.products);
      final output = handleResponse(response);
      return output;
    } catch (e) {
      rethrow;
    }
  }

  Future<AbstractResponse> wishlist() async {
    try {
      final response = await _client.get(Endpoints.wishlist);
      final output = handleResponse(response);
      return output;
    } catch (e) {
      rethrow;
    }
  }

  Future<AbstractResponse> category() async {
    try {
      final response = await _client.get(Endpoints.category);
      final output = handleResponse(response);
      return output;
    } catch (e) {
      rethrow;
    }
  }

  Future<AbstractResponse> cart() async {
    try {
      final response = await _client.get(Endpoints.cart);
      final output = handleResponse(response);
      return output;
    } catch (e) {
      rethrow;
    }
  }

  Future<AbstractResponse> addToWishlist(WishlistDto wishlistDto) async {
    try {
      final response = await _client.post(Endpoints.addToWishlist,
          data: wishlistDto.toJson());
      final output = handleResponse(response);
      return output;
    } catch (e) {
      rethrow;
    }
  }

  Future<AbstractResponse> addToCart(WishlistDto wishlistDto) async {
    try {
      final response =
          await _client.post(Endpoints.addToCart, data: wishlistDto.toJson());
      final output = handleResponse(response);
      return output;
    } catch (e) {
      rethrow;
    }
  }

  Future<AbstractResponse> removeFromCart(WishlistDto wishlistDto) async {
    try {
      final response =
          await _client.delete(Endpoints.removeFromCart, data: wishlistDto.toJson());
      final output = handleResponse(response);
      return output;
    } catch (e) {
      rethrow;
    }
  }

  Future<AbstractResponse> removeFromWishlist(WishlistDto wishlistDto) async {
    try {
      final response = await _client.delete(Endpoints.removeFromWishlist,
          data: wishlistDto.toJson());
      final output = handleResponse(response);
      return output;
    } catch (e) {
      rethrow;
    }
  }
}
