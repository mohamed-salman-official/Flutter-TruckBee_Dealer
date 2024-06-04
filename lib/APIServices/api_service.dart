import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:truckbee_flut/Navigations/route_config.dart';

import '../ModelClasses/login_model.dart';
import '../SupportFiles/common_utils.dart';
import 'network_provider.dart';

class NetworkRequest {
  final String apiUrl;
  Map<String, dynamic>? queryParams;
  Map<String, dynamic>? headerMap;
  var requestBody;

  NetworkRequest(
      {required this.apiUrl,
      this.queryParams,
      this.requestBody,
      this.headerMap}) {}

  Dio _onDio() {
    Dio dio = Dio(
      BaseOptions(
        responseType: ResponseType.json,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 60),
        // 60s
        receiveTimeout: const Duration(seconds: 60),
        // 60s
        headers: headerMap,
      ),
    );
    // dio.interceptors.add(NetworkInterceptor());
    return dio;
  }

  void get({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    _onDio().get(apiUrl, queryParameters: queryParams).then((res) {
      if (onSuccess != null) onSuccess(res);
    }).catchError((error) async {
      if (onError != null) {
        if (error is DioException) {
          if (error.type == DioExceptionType.badResponse) {
            ErrorModel errorModel =
                ErrorModel.fromJson(json.decode(error.response.toString()));
            // if (errorModel.error == "invalid_token") {
            //   await Session().clearSession();
            //   Get.offAllNamed(RouteName.LANDING_ROUTE);
            // }
            onError(errorModel);
          } else if (error.type == DioExceptionType.unknown) {
            onError(_handleError(error));
          } else {
            onError(_handleError(error));
          }
        } else {
          onError(PxException(error.toString()));
        }
      }
    });
  }

  void post({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    _onDio().post(apiUrl, data: (requestBody)).then((res) {
      if (onSuccess != null) onSuccess(res);
    }).catchError((error) async {
      if (onError != null) {
        if (error is DioException) {
          if (error.type == DioExceptionType.badResponse) {
            ErrorModel errorModel =
                ErrorModel.fromJson(json.decode(error.response.toString()));
            onError(errorModel);
          } else if (error.type == DioExceptionType.unknown) {
            onError(_handleError(error));
          } else {
            onError(_handleError(error));
          }
        } else {
          onError(PxException(error.toString()));
        }
      }
    });
  }

  void put({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    _onDio().put(apiUrl, data: (requestBody)).then((res) {
      if (onSuccess != null) onSuccess(res);
    }).catchError((error) async {
      if (onError != null) {
        if (error is DioException) {
          if (error.type == DioExceptionType.badResponse) {
            ErrorModel errorModel =
                ErrorModel.fromJson(json.decode(error.response.toString()));
            if (errorModel.error == "invalid_token") {
              await Session().clearSession();
              Get.offAllNamed(RouteName.LOGIN_ROUTE);
            }
            onError(errorModel);
          } else if (error.type == DioErrorType.unknown) {
            onError(_handleError(error));
          } else {
            onError(_handleError(error));
          }
        } else {
          onError(PxException(error.toString()));
        }
      }
    });
  }

  void delete({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    _onDio().delete(apiUrl, queryParameters: queryParams).then((res) {
      if (onSuccess != null) onSuccess(res);
    }).catchError((error) async {
      if (onError != null) {
        if (error is DioException) {
          if (error.type == DioExceptionType.badResponse) {
            ErrorModel errorModel =
                ErrorModel.fromJson(json.decode(error.response.toString()));
            onError(errorModel);
          } else if (error.type == DioExceptionType.unknown) {
            onError(_handleError(error));
          } else {
            onError(_handleError(error));
          }
        } else {
          onError(PxException(error.toString()));
        }
      }
    });
  }
}

String _handleError(DioError error) {
  String? errorDescription = "";

  switch (error.type) {
    case DioExceptionType.cancel:
      errorDescription = "Request to API server was cancelled";
      break;
    case DioExceptionType.connectionTimeout:
      errorDescription = "Connection timeout with API server";
      break;
    case DioExceptionType.connectionError:
      errorDescription =
          "Connection to API server failed due to internet connection";
      break;
    case DioExceptionType.receiveTimeout:
      errorDescription = "Receive timeout in connection with API server";
      break;
    case DioExceptionType.badResponse:
      errorDescription =
          "Error : ${error.response!.statusCode} - ${error.response!.statusMessage}";

      break;
    case DioExceptionType.sendTimeout:
      errorDescription = "Send timeout in connection with API server";
      break;
    case DioExceptionType.unknown:
      errorDescription = "${error.error.toString()}";
    case DioExceptionType.badCertificate:
    // TODO: Handle this case.
  }
  return errorDescription;
}
