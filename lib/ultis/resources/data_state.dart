import 'package:dio/dio.dart';

abstract class DataState<T> {
  T? data;
  DioException? error;

  DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess({super.data});
}

class DataFailed<T> extends DataState<T> {
  DataFailed({super.error});
}
