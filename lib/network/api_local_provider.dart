import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../ultis/ultis.dart';

class ApiLocalProvider {
  ApiLocalProvider({this.connectTimeOut = const Duration(seconds: 20000)}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveTimeout: const Duration(seconds: 10000),
        connectTimeout: connectTimeOut ?? const Duration(seconds: 20000),
      ),
    );

    // Logging
    _dio.interceptors.add(PrettyDioLogger(requestBody: true));
  }
  late Dio _dio;

  final Duration? connectTimeOut;

  final baseUrl = 'http://$iP:$port';

  Future<Map<String, dynamic>?> getRequest(
    final String endpoint, {
    final Map<String, dynamic>? queryParameters,
    final Map<String, dynamic>? headers,
    Options? options,
    final CancelToken? cancelToken,
    final ProgressCallback? onReceiveProgress,
  }) async {
    Response response;

    if (options != null && headers != null) {
      options.headers?.addAll(headers);
    } else {
      options = Options(headers: headers);
    }

    response = await _dio.get(
      endpoint,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );

    return jsonDecode(response.data) as Map<String, dynamic>?;
  }

  Future<Map<String, dynamic>?> postRequest(
    final String endpoint, {
    final Map<String, dynamic>? body,
    final Map<String, dynamic>? queryParameters,
    final Map<String, dynamic>? headers,
    Options? options,
    final CancelToken? cancelToken,
    final ProgressCallback? onSendProgress,
    final ProgressCallback? onReceiveProgress,
  }) async {
    Response response;

    if (options != null && headers != null) {
      options.headers?.addAll(headers);
    } else {
      options = Options(headers: headers);
    }

    response = await _dio.post(
      endpoint,
      data: body,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    return response.data as Map<String, dynamic>?;
  }
}
