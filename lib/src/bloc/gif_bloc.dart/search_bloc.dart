import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:summer_test/src/model/search_model.dart';
import 'package:summer_test/src/repository/search_endpoint/search_repository.dart';

import '../../../global_locator.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(NoneState());

  var gifRepository = global<GifRepository>();

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SearchGifEvent) {
      yield* _searchToState(event);
    } else if (event is GetAllGifsEvent) {
      yield* _getAllGifsToState();
    } else if (event is NoneEvent) {
      yield NoneState();
    }
  }

  Stream<SearchState> _searchToState(SearchGifEvent event) async* {
    try {
      var response = await gifRepository.getGif(toSearch: event.toSearch);

      if (response != null) {
        yield HasSearchState(searchResponse: response);
      } else {
        yield FinishWithError(
            error: 'Tenemos problemas para obtener el gif, intenta mas tarde');
      }
    } catch (e) {
      yield FinishWithError(
          error: 'Tenemos problemas para obtener el gif, intenta mas tarde');
    }
  }

  Stream<SearchState> _getAllGifsToState() async* {
    try {
      var response = await gifRepository.getAllGifs();

      if (response != null) {
        yield AllGifsState(gifs: response);
      } else {
        yield FinishWithError(
            error:
                'Tenemos problemas para obtener los gifs, intenta mas tarde');
      }
    } catch (e) {
      yield FinishWithError(
          error: 'Tenemos problemas para obtener los gifs, intenta mas tarde');
    }
  }
}
