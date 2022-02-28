import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:summer_test/src/model/search_model.dart';
import 'package:summer_test/src/repository/network/api_repository.dart';
import 'package:summer_test/src/repository/search_endpoint/search_endpoint.dart';

import '../../../global_locator.dart';

abstract class GifRepository {
  Future<SearchResponse?> getGif({required String toSearch});
}

class GifRepositoryDefault implements GifRepository {
  var apiRepository = global<APIRepository>();
  final _logger = global<Logger>();

  @override
  Future<SearchResponse?> getGif({required String toSearch}) async {
    try {
      SearchEndpoint endpoint = SearchEndpoint(toSearch: toSearch);
      Response response = await apiRepository.request(endpoint: endpoint);
      if (response.statusCode == 200) {
        _logger
            .i('GifRepositoryDefault: getGif: response.body: ${response.body}');
        SearchResponse data = searchResponseFromJson(response.body);
        return data;
      } else {
        _logger.e('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      _logger.e(e);
      return null;
    }
  }
}
