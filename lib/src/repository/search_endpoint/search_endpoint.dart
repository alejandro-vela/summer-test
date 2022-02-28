import 'package:summer_test/src/repository/network/endpoint.dart';
import 'package:summer_test/src/utils/constants/constants.dart';

class SearchEndpoint extends Endpoint {
  final String toSearch;
  SearchEndpoint({required this.toSearch});

  @override
  Method get method => Method.get;

  @override
  String get path =>
      '/search?api_key=$apiToken&q=$toSearch&limit=25&offset=0&rating=pg-13&lang=en';
}
