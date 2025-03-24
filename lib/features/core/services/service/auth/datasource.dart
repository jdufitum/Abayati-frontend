import 'package:abayati/features/core/model/request/auth.dart';
import 'package:abayati/features/core/model/response/abstract_response.dart';
import 'package:abayati/features/core/services/api/api_client.dart';
import 'package:abayati/features/core/services/api/endpoints.dart';
import 'package:dio/dio.dart';

class AuthDatasource {
  final _client = ApiClient();

  Future<AbstractResponse> register(RegisterDto registerDto) async {
    try {
      final response =
          await _client.post(Endpoints.register, data: registerDto.toJson());
      final output = handleResponse(response);
      return output;
    } catch (e) {
      rethrow;
    }
  }

  Future<AbstractResponse> login(LoginDto loginDto) async {
    try {
      final response =
          await _client.post(Endpoints.login, data: loginDto.toJson());
      final output = handleResponse(response);
      return output;
    } catch (e) {
      rethrow;
    }
  }
}
