import 'package:abayati/features/core/model/request/auth.dart';
import 'package:abayati/features/core/model/response/auth.dart';
import 'package:abayati/features/core/services/service/auth/datasource.dart';
import 'package:dartz/dartz.dart';

class AuthRepository {
  final _datasource = AuthDatasource();

  Future<Either<String, dynamic>> register(RegisterDto registerDto) async {
    final output = await _datasource.register(registerDto);
    if (output.error != null) {
      return Left(output.message!);
    } else {
      return Right(output.data);
    }
  }

  Future<Either<String, LoginRsp>> login(LoginDto loginDto) async {
    final output = await _datasource.login(loginDto);
    if (output.error != null) {
      return Left(output.message!);
    } else {
      final data = LoginRsp.fromJson(output.data);
      return Right(data);
    }
  }
}
