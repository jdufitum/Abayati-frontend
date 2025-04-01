import 'package:abayati/features/core/model/response/product.dart';
import 'package:abayati/features/utils/components/app_globals.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(const WishlistState());

  Future<void> toggleFavorite(Product product) async {
    final favorite = state.favoriteProduct.toSet();
    final wishlist = state.wishlist.toList();

    if (favorite.contains(product.id)) {
      favorite.remove(product.id);
      wishlist.remove(product);
    } else {
      favorite.add(product.id!);
      wishlist.add(product);
    }
    emit(state.copyWith(favoriteProduct: favorite, wishlist: wishlist));
  }

  Future<void> initWishlist(Product product) async {
    final favorite = state.favoriteProduct.toSet();
    favorite.add(product.id!);

    emit(state.copyWith(favoriteProduct: favorite, wishlist: globals.wishlist));
  }
}
