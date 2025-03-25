import 'package:abayati/features/core/model/response/product.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(const WishlistState());

  void toggleFavorite(Product product) {
    final favorite = state.favoriteProduct.toSet();

    if (favorite.contains(product)) {
      favorite.remove(product);
    } else {
      favorite.add(product);
    }

    emit(state.copyWith(favoriteProduct: favorite));
  }
}
