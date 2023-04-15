import 'dart:convert';
import 'package:dio/dio.dart';

enum ApiStatus {
  success,
  failure,
}

class ApiResponse {
  final int? code;
  dynamic data;
  final bool isSuccessful;
  late final String? message;
  final String? token;

  ApiResponse({
    this.code,
    this.message,
    this.data,
    required this.isSuccessful,
    this.token,
  });

  factory ApiResponse.fromResponse(Response response) {
    final json = response.data;

    return ApiResponse(
      message: json['message'],
      isSuccessful: json['isSuccessful'],
      data: json['data'],
    );
  }

  factory ApiResponse.fromBody(String json, bool isSuccessful,
      [String? token]) {
    final jsonD = jsonDecode(json);

    return ApiResponse(
      message: jsonD['message'],
      isSuccessful: isSuccessful,
      data: jsonD['data'],
      token: token,
    );
  }

  factory ApiResponse.timeout() {
    return ApiResponse(
      data: null,
      isSuccessful: false,
      message: 'Error occurred. Please try again later.',
    );
  }
}

extension ApiError on DioError {
  ApiResponse toApiError({CancelToken? cancelToken}) {
    ApiResponse apiResponse = ApiResponse(isSuccessful: false);
    switch (type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
        if (cancelToken != null) {
          cancelToken.cancel();
        }
        return ApiResponse(
          isSuccessful: false,
          data: null,
          message: "Please check your internet connection or try again later.",
        );
      case DioErrorType.unknown:
        return ApiResponse(
          isSuccessful: false,
          data: null,
          message: "Please help report this error to TestCommerce support.",
        );
      case DioErrorType.badResponse:
        final response = this.response;

        if (response != null) {
          if (response.data is Map<String, dynamic>) {
            final val = response.data;
            return ApiResponse(
              isSuccessful: false,
              message: val['message'] ?? val['error'].values.first[0],
            );
          } else {
            ApiResponse(
              isSuccessful: false,
              data: null,
              message: response.data.toString(),
            );
          }

          if (response.statusCode! >= 300 && response.statusCode! <= 399) {
            apiResponse.message = error.toString();
          }

          if (response.statusCode! >= 400 && response.statusCode! <= 499) {
            apiResponse.message = error.toString();
          }

          if (response.statusCode! >= 500 && response.statusCode! <= 599) {
            apiResponse.message = error.toString();
          }
        }
        break;
      default:
        apiResponse = response != null
            ? ApiResponse.fromResponse(response!)
            : ApiResponse(
                isSuccessful: false,
                data: null,
                message: error.toString(),
              );
        break;
    }
    return apiResponse;
  }
}
