import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:summer_test/src/repository/network/shared_configuration.dart';
import 'package:summer_test/src/utils/lang/type_safety.dart';

import '../../../global_locator.dart';
import 'endpoint.dart';

abstract class APIRepository {
  Future<Map<String, dynamic>> request({required Endpoint endpoint});
}

class DefaultAPIRepository implements APIRepository {
  final _logger = global<Logger>();

  @override
  Future<Map<String, dynamic>> request({required Endpoint endpoint}) async {
    _logger.d('Request endpoint: $endpoint');

    final url = Uri.https(
        SharedConfiguration.network.baseUrlDevelopment, endpoint.path);

    var headers = {...SharedConfiguration.network.headers};
    headers.addAll(endpoint.headers);

    switch (endpoint.method) {
      case Method.get:
        return _get(url, headers).then(_handleResponse);
      case Method.post:
        return _post(url, headers, endpoint.parameters).then(_handleResponse);
      case Method.put:
        return _put(url, headers, endpoint.parameters).then(_handleResponse);
      case Method.delete:
        return _delete(url, headers, endpoint.parameters).then(_handleResponse);
    }
  }

  Future<Response> _get(Uri url, Map<String, String> headers) {
    _logger.d('get() with url ($url) - headers ($headers)');
    return http.get(url, headers: headers);
  }

  Future<Response> _post(
      Uri url, Map<String, String> headers, Map<String, dynamic> body) {
    _logger.d('post() with url ($url) - headers ($headers) - body ($body)');
    return http.post(url,
        headers: headers, body: jsonEncode(body), encoding: Utf8Codec());
  }

  Future<Response> _put(
      Uri url, Map<String, String> headers, Map<String, dynamic> body) {
    _logger.d('put() with url ($url) - headers ($headers) - body ($body)');
    return http.put(url,
        headers: headers, body: jsonEncode(body), encoding: Utf8Codec());
  }

  Future<Response> _delete(
      Uri url, Map<String, String> headers, Map<String, dynamic> body) {
    _logger.d('delete() with url ($url) - headers ($headers) - body ($body)');
    return http.delete(url,
        headers: headers, body: jsonEncode(body), encoding: Utf8Codec());
  }

  Map<String, dynamic> _handleResponse(Response response) {
    _logger.d('Response - statusCode: ${response.statusCode}');
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final decodedBody = json.decode(response.body);
      _logger.d('Response - body: $decodedBody');
      final map = cast<Map<String, dynamic>>(decodedBody);
      _logger.d('Response - body map: $map');
      if (map != null) return map;
    }
    _logger.d('Response error');

    throw Exception('Error with http code ${response.statusCode}');
  }
}
