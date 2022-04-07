import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CustomDio {
  late Dio _dio;
  Dio get instance => _dio;

  CustomDio.getInstance() {
    _dio = Dio(_getOptions());
    _dio.interceptors.add(interpceptorResponse());
    _dio.interceptors.add(interpceptorRequest());
    _dio.interceptors.add(interpceptorOnError());
  }

  BaseOptions _getOptions() => BaseOptions(
        baseUrl: "https://pokeapi.co/api/v2/pokemon/",
        connectTimeout: 10000,
        receiveTimeout: 10000,
      );

  getPokemons() {
    var uri = Uri.parse(_getOptions().baseUrl);
    return uri;
  }

  getDetailsPokemonByName(String name) {
    var uri = Uri.parse("${_getOptions().baseUrl}$name");
    return uri;
  }
}

InterceptorsWrapper interpceptorRequest() {
  return InterceptorsWrapper(onRequest: (requestOptions, handler) {
    debugPrint("===== ON REQUEST =======");
    debugPrint(requestOptions.path);
    debugPrint(requestOptions.method);
    handler.next(requestOptions);
  });
}

InterceptorsWrapper interpceptorResponse() {
  return InterceptorsWrapper(onResponse: (responseOptins, handler) {
    debugPrint("======= ON RESPONSE =====");
    debugPrint(responseOptins.requestOptions.path);
    debugPrint(responseOptins.requestOptions.method);
    debugPrint(responseOptins.data.toString());
    handler.next(responseOptins);
  });
}

InterceptorsWrapper interpceptorOnError() {
  return InterceptorsWrapper(onError: (dioerror, handler) {
    debugPrint("===== ERROR ======");
    debugPrint(dioerror.message);
  });
}
