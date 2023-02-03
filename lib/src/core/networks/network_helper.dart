import 'package:dio/dio.dart';
import 'package:dotapps/src/core/data/constants.dart';
import 'package:dotapps/src/core/networks/logging_interceptor.dart';
import 'package:dotapps/src/utils/app_helper.dart';

class NetworkHelper {
  NetworkHelper() {
    _dio = Dio(BaseOptions(
      baseUrl: URLs.host,
      connectTimeout: AppLimit.REQUEST_TIME_OUT,
      receiveTimeout: AppLimit.REQUEST_TIME_OUT,
      sendTimeout: AppLimit.REQUEST_TIME_OUT,
    ));
    if (isInDebugMode) {
      _dio?.interceptors.add(LoggingInterceptor());
    }
  }

  Dio? _dio;

  Future<dynamic> get(String url) async {
    dynamic response;
    try {
      response = await _dio?.get<dynamic>(url);
    } catch (err) {
      rethrow;
    }
    return response;
  }
}
