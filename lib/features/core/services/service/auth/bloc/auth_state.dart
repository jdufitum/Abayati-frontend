part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class LoginSuccess extends AuthState {
  final LoginRsp loginRsp;

  const LoginSuccess({required this.loginRsp});
}

final class LoginError extends AuthState {
  final String error;

  const LoginError({required this.error});
}

final class RegisterSuccess extends AuthState {}

final class RegisterError extends AuthState {
  final String error;

  const RegisterError({required this.error});
}
