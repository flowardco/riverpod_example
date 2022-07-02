import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:salt/domain/config/config.dart';
import 'package:salt/domain/config/http_request_type.dart';
import 'package:salt/domain/config/routes.dart';

class BaseAPI {
  ///I did not create delete, pos and etc because we did not need them in this project
  Map<String, String> _getHeader() => {
        "Content-Type": "application/json",
        "Accept": "*/*",
      };

  String _getUrl(Routes route) => "${Config.base}/${route.url}";

  String _getBody(dynamic body) => jsonEncode(body);

  Future<TResponse?> _createRequest<TResponse>({
    required Routes route,
    dynamic body,
    dynamic query,
    required HttpRequestType requestType,
  }) async {
    try {
      _print("${requestType.type} ${route.url}");
      var url = _getUrl(route);
      var headers = _getHeader();
      var dio = Dio(
        BaseOptions(
          responseType: ResponseType.json,
          baseUrl: Config.base,
          headers: headers,
          method: requestType.type,
        ),
      );

      var response = await dio.request<TResponse>(
        url,
        data: _getBody(body),
        queryParameters: query,
        options: Options(
          method: requestType.type,
        ),
      );
      _print("response: ${response.data}");
      return response.data;
    } on DioError catch (ex) {
      _print("Dio error: ${ex.response?.data}");
    } catch (ex) {
      _print(ex);
    }
    return null;
  }

  void _print(dynamic object) {
    debugPrint(object);
  }

  Future<TResponse?> get<TResponse>({
    required Routes route,
    dynamic query,
  }) async =>
      _createRequest(
        requestType: HttpRequestType.get,
        route: route,
        query: query,
      );
}
