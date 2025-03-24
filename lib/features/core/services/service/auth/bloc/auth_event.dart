part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class LoginEvent extends AuthEvent {
  final LoginDto loginDto;

  LoginEvent({required this.loginDto});
}

final class RegisterEvent extends AuthEvent {
  final RegisterDto registerDto;

  RegisterEvent({required this.registerDto});
}
