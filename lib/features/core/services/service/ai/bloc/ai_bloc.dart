import 'dart:io';

import 'package:abayati/features/core/model/response/measurement.dart';
import 'package:abayati/features/core/services/api/exception/network_exception.dart';
import 'package:abayati/features/core/services/service/ai/repository.dart';
import 'package:abayati/features/utils/components/app_globals.dart';
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
      emit(SearchLoading());
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
    on<GetMeasurementEvent>((event, emit) async {
      emit(GetMeasurementLoading());
      try {
        final result = await _repository.getMeasurement();
        result.fold((error) => emit(GetMeasurementError(error: error)), (data) {
          globals.measurement = data;
          emit(GetMeasurementSuccess(measurement: data));
        });
      } catch (e) {
        final excp = NetworkExceptions.getDioException(e);
        final error = NetworkExceptions.getErrorMessage(excp);
        emit(GetMeasurementError(error: error));
      }
    });
    on<CreateMeasurementEvent>((event, emit) async {
      emit(AiLoading());
      try {
        final result = await _repository.createMeasurements(
            height: event.height,
            width: event.width,
            frontImage: event.frontImage,
            sideImage: event.sideImage);
        result.fold((error) => emit(CreateMeasurementError(error: error)),
            (data) => emit(CreateMeasurementSuccess()));
      } catch (e) {
        final excp = NetworkExceptions.getDioException(e);
        final error = NetworkExceptions.getErrorMessage(excp);
        emit(CreateMeasurementError(error: error));
      }
    });
  }
}
