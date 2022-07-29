import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:movie_flutter/config.dart';

export 'package:http/http.dart' show Response;

class InterceptorResult {
  InterceptorResult({
    required this.url,
    required this.headers,
    required this.queryParameters,
  });

  String url;
  Map<String, String> headers;
  Map<String, dynamic> queryParameters;
}

class Http {
  static Future<Map<String, String>> getHeaders() async {
    return {'api_key': Config.apiKey};
  }

  static Future<Map<String, String>> getQueryParameters() async {
    return {'api_key': Config.apiKey};
  }

  static Future<InterceptorResult> interceptor(
      String url,
      Map<String, String>? headers,
      Map<String, dynamic>? queryParameters) async {
    if (url.substring(0, 1) == ':') {
      url = url.replaceFirst(':', '${Config.baseUrl}/');

      headers ??= await Http.getHeaders();
      queryParameters ??= await getQueryParameters();
      //TODO Add append headers/queryParameters
    }
    headers ??= {};
    queryParameters ??= {};

    return InterceptorResult(
        headers: headers, url: url, queryParameters: queryParameters);
  }

  static Future<http.Response> get(String url,
      {Map<String, String>? headers,
      Map<String, String>? queryParameters}) async {
    InterceptorResult interceptor =
        await Http.interceptor(url, headers, queryParameters);

    var uri = Uri.parse(interceptor.url);
    uri = uri.replace(queryParameters: interceptor.queryParameters);

    return http.get(uri, headers: interceptor.headers);
  }

  static Future<http.Response> post(String url,
      {Map<String, String>? headers,
      Object? body,
      Encoding? encoding,
      Map<String, dynamic>? queryParameters}) async {
    InterceptorResult interceptor =
        await Http.interceptor(url, headers, queryParameters);

    var uri = Uri.parse(interceptor.url);
    uri = uri.replace(queryParameters: interceptor.queryParameters);

    return http.post(uri,
        headers: interceptor.headers, body: body, encoding: encoding);
  }

  static Future<http.Response> put(String url,
      {Map<String, String>? headers,
      Object? body,
      Encoding? encoding,
      Map<String, dynamic>? queryParameters}) async {
    InterceptorResult interceptor =
        await Http.interceptor(url, headers, queryParameters);

    var uri = Uri.parse(interceptor.url);
    uri = uri.replace(queryParameters: interceptor.queryParameters);

    return http.put(uri,
        headers: interceptor.headers, body: body, encoding: encoding);
  }

  static Future<http.Response> patch(String url,
      {Map<String, String>? headers,
      Object? body,
      Encoding? encoding,
      Map<String, dynamic>? queryParameters}) async {
    InterceptorResult interceptor =
        await Http.interceptor(url, headers, queryParameters);

    var uri = Uri.parse(interceptor.url);
    uri = uri.replace(queryParameters: interceptor.queryParameters);

    return http.patch(uri,
        headers: interceptor.headers, body: body, encoding: encoding);
  }

  static Future<http.Response> delete(String url,
      {Map<String, String>? headers,
      Object? body,
      Encoding? encoding,
      Map<String, dynamic>? queryParameters}) async {
    InterceptorResult interceptor =
        await Http.interceptor(url, headers, queryParameters);

    var uri = Uri.parse(interceptor.url);
    uri = uri.replace(queryParameters: interceptor.queryParameters);

    return http.delete(uri, headers: interceptor.headers);
  }
}
