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
      await Future.delayed(const Duration(seconds: 1));
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
      return ApiResponse.fromResponse(response);
    } on DioError catch (error) {
      return error.toApiError(cancelToken: cancelToken);
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
      return error.toApiError(cancelToken: cancelToken);
    }
  }

  Future<ApiResponse> patch(String endpoint, {required dynamic data}) async {
    try {
      final response = await _dio.patch(endpoint, data: jsonDecode(data));
      return ApiResponse.fromResponse(response);
    } on DioError catch (error) {
      return error.toApiError(cancelToken: CancelToken());
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
      return error.toApiError(cancelToken: cancelToken);
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
      return error.toApiError(cancelToken: cancelToken);
    }
  }
}
