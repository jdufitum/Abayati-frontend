//register user dto
class RegisterDto {
  final String username;
  final String email;
  final String password;

  RegisterDto({
    required this.username,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
      };
}

//login user dto
class LoginDto {
  final String email;
  final String password;

  LoginDto({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
