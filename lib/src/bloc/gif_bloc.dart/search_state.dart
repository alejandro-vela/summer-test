part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class NoneState extends SearchState {}

class HasSearchState extends SearchState {
  final SearchResponse searchResponse;
  const HasSearchState({required this.searchResponse});
}

class AllGifsState extends SearchState {
  final List<Datum> gifs;
  const AllGifsState({required this.gifs});
}

class FinishWithError extends SearchState {
  final String error;

  const FinishWithError({required this.error});

  @override
  String toString() => '$runtimeType { error }';
}
