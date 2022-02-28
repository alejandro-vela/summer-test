part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class NoneEvent extends SearchEvent {}

class SearchGif extends SearchEvent {
  final String toSearch;
  const SearchGif({required this.toSearch});
}
