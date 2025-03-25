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
  }
}
