import 'dart:io';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../utils/components/logger.dart';

part 'network_exception.freezed.dart';

@freezed
abstract class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.unauthorisedRequest() = UnauthorisedRequest;

  const factory NetworkExceptions.badRequest() = BadRequest;

  const factory NetworkExceptions.notFound(String reason) = NotFound;

  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable() = NotAcceptable;

  const factory NetworkExceptions.requestTimeout() = RequestTimeout;

  const factory NetworkExceptions.sendTimeout() = SendTimeout;

  const factory NetworkExceptions.conflict() = Conflict;

  const factory NetworkExceptions.internalServerError() = InternalServerError;

  const factory NetworkExceptions.notImplemented() = NotImplemented;

  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.unableToProcess() = UnableToProcess;

  const factory NetworkExceptions.defaultError(String error) = DefaultError;

  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  static NetworkExceptions getDioException(error) {
    NetworkExceptions networkExceptions;
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.cancel:
          networkExceptions = const NetworkExceptions.requestCancelled();
          break;
        case DioExceptionType.connectionTimeout:
          networkExceptions = const NetworkExceptions.requestTimeout();
          break;
        case DioExceptionType.unknown:
          networkExceptions = const NetworkExceptions.noInternetConnection();
          break;
        case DioExceptionType.receiveTimeout:
          networkExceptions = const NetworkExceptions.sendTimeout();
          break;
        case DioExceptionType.badResponse:
          Console.log("ERROR", error.response!.data);
          if (error.response?.statusCode == 503) {
            networkExceptions = const NetworkExceptions.serviceUnavailable();
          } else if (error.response?.statusCode == 504) {
            networkExceptions = const NetworkExceptions.notFound(
                'Gateway timeout, please try again');
          } else if (error.response!.data['message'] != null) {
            if (error.response!.data['message'] is List) {
              networkExceptions = NetworkExceptions.notFound(
                  (error.response!.data['message'] as List).first);
            } else {
              networkExceptions =
                  NetworkExceptions.notFound(error.response!.data['message']);
            }
          }
          // else {
          //   networkExceptions = NetworkExceptions.notFound(
          //       error.response!.data['error'] ?? 'Unknown error');
          // }
          else {
            if (error.response!.data.runtimeType is! String) {
              networkExceptions = NetworkExceptions.notFound(
                  error.response!.data['error'] ?? 'Unknown error');
            } else {
              networkExceptions = NetworkExceptions.notFound(
                  error.response!.data ?? 'Unknown error');
            }
          }

          break;
        case DioExceptionType.sendTimeout:
          networkExceptions = const NetworkExceptions.sendTimeout();
          break;
        case DioExceptionType.badCertificate:
          networkExceptions = const NetworkExceptions.notAcceptable();
          break;
        case DioExceptionType.connectionError:
          networkExceptions = const NetworkExceptions.unableToProcess();
          break;
      }
    } else if (error is SocketException) {
      networkExceptions = const NetworkExceptions.noInternetConnection();
    } else {
      networkExceptions = const NetworkExceptions.unexpectedError();
    }
    return networkExceptions;
  }

  static String getErrorMessage(NetworkExceptions networkExceptions) {
    var errorMessage = "";
    networkExceptions.when(notImplemented: () {
      errorMessage = "Not Implemented";
    }, requestCancelled: () {
      errorMessage = "Request Cancelled";
    }, internalServerError: () {
      errorMessage = "Internal Server Error";
    }, notFound: (String reason) {
      errorMessage = reason;
    }, serviceUnavailable: () {
      errorMessage = "Service Unavailable";
    }, methodNotAllowed: () {
      errorMessage = "Method Allowed";
    }, badRequest: () {
      errorMessage = "Bad request";
    }, unauthorisedRequest: () {
      errorMessage = "Unauthorised request";
    }, unexpectedError: () {
      errorMessage = "Invalid input";
    }, requestTimeout: () {
      errorMessage = "Connection request timeout";
    }, noInternetConnection: () {
      errorMessage = "No internet connection";
    }, conflict: () {
      errorMessage = "Error due to a conflict";
    }, sendTimeout: () {
      errorMessage = "Send timeout in connection with API server";
    }, unableToProcess: () {
      errorMessage = "Invalid input";
    }, defaultError: (String error) {
      errorMessage = error;
    }, formatException: () {
      errorMessage = "Invalid input";
    }, notAcceptable: () {
      errorMessage = "Not acceptable";
    });
    return errorMessage;
  }
}
