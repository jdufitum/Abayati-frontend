import 'package:abayati/features/core/model/request/product.dart';
import 'package:abayati/features/core/model/response/product.dart';
import 'package:abayati/features/core/services/service/product/repository.dart';
import 'package:abayati/features/utils/components/app_globals.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/exception/network_exception.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final _repository = ProductRepository();

  ProductBloc() : super(ProductInitial()) {
    on<AllProductEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        final result = await _repository.allProduct();
        result.fold((error) => AllProductError(error: error), (data) {
          globals.allProducts = data;
          emit(AllProductSuccess(allProducts: data));
        });
      } catch (e) {
        final ex = NetworkExceptions.getDioException(e);
        final error = NetworkExceptions.getErrorMessage(ex);
        emit(AllProductError(error: error));
      }
    });
    on<WishlistEvent>((event, emit) async {
      emit(WishlistLoading());
      try {
        final result = await _repository.wishlist();
        result.fold((error) => WishlistError(error: error), (data) {
          globals.wishlist = data;
          emit(WishlistSuccess(wishlist: data));
        });
      } catch (e) {
        final ex = NetworkExceptions.getDioException(e);
        final error = NetworkExceptions.getErrorMessage(ex);
        emit(WishlistError(error: error));
      }
    });
    on<CartEvent>((event, emit) async {
      emit(WishlistLoading());
      try {
        final result = await _repository.cart();
        result.fold((error) => CategoryError(error: error), (data) {
          globals.cart = data;
          emit(CartSuccess(cart: data));
        });
      } catch (e) {
        final ex = NetworkExceptions.getDioException(e);
        final error = NetworkExceptions.getErrorMessage(ex);
        emit(CartError(error: error));
      }
    });
    on<StoresEvent>((event, emit) async {
      emit(StoresLoading());
      try {
        final result = await _repository.stores();
        result.fold((error) => StoreError(error: error), (data) {
          // globals.cart = data;
          emit(StoreSuccess(stores: data));
        });
      } catch (e) {
        final ex = NetworkExceptions.getDioException(e);
        final error = NetworkExceptions.getErrorMessage(ex);
        emit(StoreError(error: error));
      }
    });
    on<StoresByCategoryEvent>((event, emit) async {
      emit(StoresLoading());
      try {
        final result = await _repository.storesByCategory(event.id);
        result.fold((error) => StoreByCategoryError(error: error), (data) {
          emit(StoreByCategorySuccess(stores: data));
        });
      } catch (e) {
        final ex = NetworkExceptions.getDioException(e);
        final error = NetworkExceptions.getErrorMessage(ex);
        emit(StoreByCategoryError(error: error));
      }
    });
    on<CategoryEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        final result = await _repository.category();
        result.fold((error) => CategoryError(error: error), (data) {
          globals.category = data;
          emit(CategorySuccess(category: data));
        });
      } catch (e) {
        final ex = NetworkExceptions.getDioException(e);
        final error = NetworkExceptions.getErrorMessage(ex);
        emit(CategoryError(error: error));
      }
    });
    on<AddToWishlistEvent>((event, emit) async {
      emit(WishlistLoading());
      try {
        final result = await _repository.addToWishlist(event.wishlistDto);
        result.fold((error) => AddToWishlistError(error: error),
            (data) => emit(AddToWishlistSuccess()));
      } catch (e) {
        final ex = NetworkExceptions.getDioException(e);
        final error = NetworkExceptions.getErrorMessage(ex);
        emit(AddToWishlistError(error: error));
      }
    });
    on<AddToCartEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        final result = await _repository.addToCart(event.wishlistDto);
        result.fold((error) => AddToCartError(error: error),
            (data) => emit(AddToCartSuccess(message: data.message!)));
      } catch (e) {
        final ex = NetworkExceptions.getDioException(e);
        final error = NetworkExceptions.getErrorMessage(ex);
        emit(AddToCartError(error: error));
      }
    });
    on<RemoveFromWishlistEvent>((event, emit) async {
      emit(WishlistLoading());
      try {
        final result = await _repository.removeFromWishlist(event.wishlistDto);
        result.fold((error) => RemoveFromWishlistError(error: error),
            (data) => emit(RemoveFromWishlistSuccess()));
      } catch (e) {
        final ex = NetworkExceptions.getDioException(e);
        final error = NetworkExceptions.getErrorMessage(ex);
        emit(RemoveFromWishlistError(error: error));
      }
    });
    on<RemoveFromCartEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        final result = await _repository.removeFromCart(event.wishlistDto);
        result.fold((error) => RemoveFromCartError(error: error),
            (data) => emit(RemoveFromCartSuccess()));
      } catch (e) {
        final ex = NetworkExceptions.getDioException(e);
        final error = NetworkExceptions.getErrorMessage(ex);
        emit(RemoveFromCartError(error: error));
      }
    });
  }
}
