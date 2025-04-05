import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../../../utils/app_route.dart';
import '../../../utils/components/app_globals.dart';
import '../../../utils/components/logger.dart';
import 'endpoints.dart';

class ApiClient {
  final Dio _dio;

  ApiClient({Dio? dio})
      : _dio = dio ??
            Dio(BaseOptions(
                baseUrl: Endpoints.baseUrl,
                connectTimeout: const Duration(seconds: 15),
                receiveTimeout: const Duration(seconds: 15),
                sendTimeout: const Duration(seconds: 15),
                headers: {'Authorization': 'Bearer ${globals.token}'})) {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (DioException error, ErrorInterceptorHandler handler) {
        Console.log('StatusCode', error.response!.statusCode);
        Console.log('StatusResponse', error.response);
        if (error.response?.statusCode == 403) {
          // showErrorBar(navigatorKey.currentState!.context,
          //     message: error.message!);
          Navigator.pushNamedAndRemoveUntil(navigatorKey.currentState!.context,
              AppRoute.signIn, (route) => false);
        }
        return handler.next(error);
      },
    ));
  }

  Future<Response> get(String url, {Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.get(url,
          queryParameters: params,
          options:
              Options(headers: {'Authorization': 'Bearer ${globals.token}'}));
      return response;
    } on FormatException {
      throw const FormatException('Bad response format 👎');
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(String url,
      {Map<String, dynamic>? data, Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.post(url,
          data: data,
          queryParameters: params,
          options:
              Options(headers: {'Authorization': 'Bearer ${globals.token}'}));
      return response;
    } on FormatException {
      throw const FormatException('Bad response format 👎');
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> patch(String url, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.patch(url,
          data: data,
          options:
              Options(headers: {'Authorization': 'Bearer ${globals.token}'}));
      return response;
    } on FormatException {
      throw const FormatException('Bad response format 👎');
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(String url,
      {Map<String, dynamic>? data, Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.put(url,
          data: data,
          queryParameters: params,
          options:
              Options(headers: {'Authorization': 'Bearer ${globals.token}'}));
      return response;
    } on FormatException {
      throw const FormatException('Bad response format 👎');
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(String url, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.delete(url,
          data: data,
          options:
              Options(headers: {'Authorization': 'Bearer ${globals.token}'}));
      return response;
    } on FormatException {
      throw const FormatException('Bad response format 👎');
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> sendFormData(
    String url, {
    required FormData formData,
  }) async {
    try {
      final response = await _dio.post(url,
          data: formData,
          options:
              Options(headers: {'Authorization': 'Bearer ${globals.token}'}));
      return response;
    } on FormatException {
      throw const FormatException("Bad response format 👎");
    } catch (e) {
      rethrow;
    }
  }

// Future<dynamic> uploadImage({
//   required String url,
//   required XFile file,
// }) async {
//   String fileName = file.path.split('/').last;
//
//   FormData formData = FormData.fromMap(
//       {'image': await MultipartFile.fromFile(file.path, filename: fileName)});
//   try {
//     final response = await _dio.post(url,
//         data: formData,
//         options:
//         Options(headers: {'Authorization': 'Bearer ${globals.token}'}));
//     return response;
//   } on FormatException {
//     throw const FormatException('Bad response format 👎');
//   } catch (e) {
//     rethrow;
//   }
// }
}
