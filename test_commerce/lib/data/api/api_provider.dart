import 'dart:convert';

import 'package:dio/dio.dart';

import '../../consts/app_constants.dart';
import 'api_response.dart';

class Api {
  static const baseUrl = AppConstants.baseUrl;

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  Future<ApiResponse> get(String endpoint,
      {Map<String, dynamic>? queryParameters, CancelToken? cancelToken}) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
      return ApiResponse.fromResponse(response);
    } on DioError catch (error) {
      _handleError(error);
      rethrow;
    } catch (e) {
      _handleError2(e);
      rethrow;
    }
  }

  Future<ApiResponse> post(String endpoint,
      {required dynamic data, CancelToken? cancelToken}) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: jsonEncode(data),
        cancelToken: cancelToken,
      );
      return ApiResponse.fromResponse(response);
    } on DioError catch (error) {
      _handleError(error);
      rethrow;
    } catch (e) {
      _handleError2(e);
      rethrow;
    }
  }

  Future<ApiResponse> patch(String endpoint, {required dynamic data}) async {
    try {
      final response = await _dio.patch(endpoint, data: jsonDecode(data));
      return ApiResponse.fromResponse(response);
    } on DioError catch (error) {
      _handleError(error);
      rethrow;
    } catch (e) {
      _handleError2(e);
      rethrow;
    }
  }

  Future<ApiResponse> put(String endpoint,
      {required dynamic data, CancelToken? cancelToken}) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: jsonEncode(data),
        cancelToken: cancelToken,
      );
      return ApiResponse.fromResponse(response);
    } on DioError catch (error) {
      _handleError(error);
      rethrow;
    } catch (e) {
      _handleError2(e);
      rethrow;
    }
  }

  Future<ApiResponse> delete(String endpoint,
      {required dynamic data, CancelToken? cancelToken}) async {
    try {
      final response = await _dio.delete(
        endpoint,
        data: jsonEncode(data),
        cancelToken: cancelToken,
      );
      return ApiResponse.fromResponse(response);
    } on DioError catch (error) {
      _handleError(error);
      rethrow;
    }
  }

  void _handleError(DioError error) {
    if (error.response != null) {
      final statusCode = error.response!.statusCode;
      //  final errorMessage = _getErrorMessageFromResponse(error.response!);
      throw NewApiError(
          error.message ?? 'An error occurred', statusCode ?? 404);
    } else if (error.type == DioErrorType.connectionTimeout) {
      throw NewApiError('Connection timeout occurred', 0);
    } else if (error.type == DioErrorType.sendTimeout) {
      throw NewApiError('Request send timeout occurred', 0);
    } else if (error.type == DioErrorType.receiveTimeout) {
      throw NewApiError('Response timeout occurred', 0);
    } else if (error.type == DioErrorType.cancel) {
      throw NewApiError('Request was cancelled', 0);
    } else {
      throw NewApiError('Network error occurred', 0);
    }
  }

  void _handleError2(e) {
    throw NewApiError(e.toString(), 0);
  }
}
