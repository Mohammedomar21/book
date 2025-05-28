import 'dart:developer';
import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(message: 'Connection timeout with API server.');
      case DioExceptionType.sendTimeout:
        return ServerFailure(message: 'Send timeout with API server.');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(message: 'Receive timeout with API server.');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(e.response?.statusCode, e.response?.data);
      case DioExceptionType.badCertificate:
        return ServerFailure(message: 'Bad certificate from API server.');
      case DioExceptionType.cancel:
        return ServerFailure(message: 'Request to API server was cancelled.');
      case DioExceptionType.connectionError:
        return ServerFailure(message: 'No internet connection.');
      case DioExceptionType.unknown:
      default:
        return ServerFailure(message: 'Oops, there was an error. Please try again.');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    try {
      switch (statusCode) {
        case 400:
        case 401:
        case 403:
          if (response is Map<String, dynamic> &&
              response['error'] is Map &&
              response['error']['message'] is String) {
            return ServerFailure(message: response['error']['message']);
          } else {
            return ServerFailure(message: 'Unauthorized or bad request.');
          }
        case 404:
          return ServerFailure(message: 'Your request was not found. Please try again.');
        case 500:
          return ServerFailure(message: 'There is a problem with the server. Please try again.');
        default:
          return ServerFailure(message: 'There was an error. Please try again.');
      }
    } catch (e, stack) {
      log('Error parsing failure response: $e\n$stack');
      return ServerFailure(message: 'Unexpected error occurred.');
    }
  }
}
