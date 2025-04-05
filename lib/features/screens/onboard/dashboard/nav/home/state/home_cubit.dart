import 'package:abayati/features/core/model/response/product.dart';
import 'package:abayati/features/utils/components/app_globals.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void initProduct() {
    emit(state.copyWith(allProducts: globals.allProducts));
  }

  void setQuery(String? query) {
    emit(state.copyWith(query: query));
  }
}
