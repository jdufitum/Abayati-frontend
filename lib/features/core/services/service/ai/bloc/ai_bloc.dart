import 'package:abayati/features/core/services/api/exception/network_exception.dart';
import 'package:abayati/features/core/services/service/ai/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../model/response/product.dart';

part 'ai_event.dart';

part 'ai_state.dart';

class AiBloc extends Bloc<AiEvent, AiState> {
  final _repository = AIRepository();

  AiBloc() : super(AiInitial()) {
    on<SearchEvent>((event, emit) async {
      emit(AiLoading());
      try {
        final result = await _repository.search(event.query);
        result.fold((error) => emit(SearchError(error: error)),
            (data) => emit(SearchSuccess(products: data)));
      } catch (e) {
        final excp = NetworkExceptions.getDioException(e);
        final error = NetworkExceptions.getErrorMessage(excp);
        emit(SearchError(error: error));
      }
    });
  }
}
