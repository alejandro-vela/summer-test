import 'package:summer_test/src/repository/network/endpoint.dart';
import 'package:summer_test/src/utils/constants/constants.dart';

class SearchEndpoint extends Endpoint {
  final String toSearch;
  SearchEndpoint({required this.toSearch});

  @override
  Method get method => Method.get;

  @override
  Map<String, dynamic> get queryParameters => {
        'q': 'Hello',
        'page': '1',
        'per_page': '25',
        'api_key': apiToken,
        'offset': '0',
        'rating': 'pg-13',
        'lang': 'en'
      };

  @override
  String get path => '/v1/gifs/search';
}
