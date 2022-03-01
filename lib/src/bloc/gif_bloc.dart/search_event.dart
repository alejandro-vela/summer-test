part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class NoneEvent extends SearchEvent {}

class SearchGifEvent extends SearchEvent {
  final String toSearch;
  const SearchGifEvent({required this.toSearch});
}

class GetAllGifsEvent extends SearchEvent {}
