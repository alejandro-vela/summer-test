import 'package:flutter/material.dart';
import 'package:summer_test/src/bloc/gif_bloc.dart/search_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summer_test/src/model/search_model.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SearchBloc _bloc = SearchBloc();
  SearchResponse? searchResponse;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is HasSearchState) {
            searchResponse = searchResponse;
          }

          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  _bloc.add(SearchGif(toSearch: 'cats'));
                },
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                  child: Text('cats'),
                ),
              ),
              searchResponse != null
                  ? Container(
                      child: Text(searchResponse!.data[0].title),
                    )
                  : CircularProgressIndicator(),
            ],
          );
        });
  }
}
