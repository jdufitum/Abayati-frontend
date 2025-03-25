import 'package:abayati/features/core/model/request/auth.dart';
import 'package:abayati/features/core/model/response/auth.dart';
import 'package:abayati/features/core/services/api/exception/network_exception.dart';
import 'package:abayati/features/core/services/service/auth/repository.dart';
import 'package:abayati/features/utils/components/app_globals.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _repository = AuthRepository();

  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final result = await _repository.login(event.loginDto);
        result.fold((error) => emit(LoginError(error: error)), (user) {
          globals.token = user.token;
          globals.user = user.data;
          emit(LoginSuccess(loginRsp: user));
        });
      } catch (e) {
        final ex = NetworkExceptions.getDioException(e);
        final error = NetworkExceptions.getErrorMessage(ex);
        emit(LoginError(error: error));
      }
    });
    on<RegisterEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final result = await _repository.register(event.registerDto);
        result.fold((error) => emit(RegisterError(error: error)),
            (r) => emit(RegisterSuccess()));
      } catch (e) {
        final ex = NetworkExceptions.getDioException(e);
        final error = NetworkExceptions.getErrorMessage(ex);
        emit(RegisterError(error: error));
      }
    });
  }
}
