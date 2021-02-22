import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:surf_cinema/layers/api/errors_handler.dart';
import 'package:surf_cinema/layers/exceptions/common.dart';
import 'package:surf_cinema/layers/exceptions/network.dart';

class DioClient {
  final Dio _dio;
  final String baseEndpoint;

  DioClient(
    this._dio, {
    @required this.baseEndpoint,
  }) : assert(baseEndpoint != null);

  Future<Response<T>> get<T>(
    String endpoint,
  ) async {
    await _checkNetworkAvailability();
    try {
      return _dio.get(
        '$baseEndpoint$endpoint',
      );
    } on DioError catch (e) {
      throw dioErrorToException(e);
    }
  }

  Future<Response<T>> post<T>(
    String endpoint, {
    // ignore: avoid_annotating_with_dynamic
    dynamic data,
  }) async {
    await _checkNetworkAvailability();
    try {
      return await _dio.post(
        '$baseEndpoint$endpoint',
        data: data,
      );
    } on DioError catch (e) {
      throw dioErrorToException(e);
    }
  }

  Future<Response<T>> patch<T>(
    String endpoint, {
    // ignore: avoid_annotating_with_dynamic
    dynamic data,
  }) async {
    await _checkNetworkAvailability();
    try {
      return await _dio.patch(
        '$baseEndpoint$endpoint',
        data: data,
      );
    } on DioError catch (e) {
      throw dioErrorToException(e);
    }
  }

  Future<Response<T>> put<T>(
    String endpoint, {
    // ignore: avoid_annotating_with_dynamic
    dynamic data,
  }) async {
    await _checkNetworkAvailability();
    try {
      return await _dio.put(
        '$baseEndpoint$endpoint',
        data: data,
      );
    } on DioError catch (e) {
      throw dioErrorToException(e);
    }
  }

  Future<Response<T>> delete<T>(
    String endpoint, {
    // ignore: avoid_annotating_with_dynamic
    dynamic data,
  }) async {
    await _checkNetworkAvailability();
    try {
      return await _dio.delete(
        '$baseEndpoint$endpoint',
        data: data,
      );
    } on DioError catch (e) {
      throw dioErrorToException(e);
    }
  }

  Map<String, dynamic> getJsonBody<T>(Response<T> response) {
    try {
      return response.data as Map<String, dynamic>;
    } on Exception catch (e, stackTrace) {
      debugPrint(stackTrace.toString());
      throw SchemeConsistencyException('Bad body format');
    }
  }

  List<dynamic> getJsonBodyList<T>(Response<T> response) {
    try {
      return response.data as List<dynamic>;
    } on Exception catch (e, stackTrace) {
      debugPrint(stackTrace.toString());
      throw SchemeConsistencyException('Bad body format');
    }
  }

  Future<void> _checkNetworkAvailability() async {
    final isNetworkAvailable = await DataConnectionChecker().hasConnection;
    if (!isNetworkAvailable) {
      throw NoInternetException();
    }
  }
}
