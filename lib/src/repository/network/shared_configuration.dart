import 'dart:io';

abstract class SharedConfiguration {
  static const network = Network._();
}

class Network {
  const Network._();

  final Map<String, String> headers = const {
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.contentTypeHeader: 'application/json',
  };
  final String baseUrlDevelopment = 'api.giphy.com';
}
