import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:summer_test/src/bloc/gif_bloc.dart/search_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summer_test/src/model/search_model.dart';
import 'package:summer_test/src/utils/widget/loading.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SearchBloc _bloc = SearchBloc();
  SearchResponse? searchResponse;
  List<Datum>? gifs;
  String? valueToSearch;
  bool isLoading = true;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _bloc.add(GetAllGifsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state is HasSearchState) {
          Future.delayed(Duration(seconds: 1), () {
            setState(() {
              searchResponse = null;
              searchResponse = state.searchResponse;
              isLoading = false;
            });
          });
        }
        if (state is AllGifsState) {
          Future.delayed(Duration(seconds: 1), () {
            setState(() {
              gifs = state.gifs;
              isLoading = false;
            });
          });
        }
        if (state is FinishWithError) {
          isLoading = false;
          return Center(
            child: Text('Error' + state.error),
          );
        }

        return SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: 90.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          searchBar,
                          SizedBox(height: 20),
                          valueToSearch != null
                              ? searchResponse != null
                                  ? searchAnswer(gifs: searchResponse!)
                                  : noResult
                              : Container(),
                          valueToSearch == null
                              ? gifs != null
                                  ? listGif(gifs: gifs!)
                                  : Container()
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                ),
                if (isLoading) Loading()
              ],
            ),
          ),
        );
      },
    );
  }

  Widget get searchBar => SizedBox(
        width: 100.w,
        child: Row(
          children: [
            SizedBox(
              width: valueToSearch != '' && valueToSearch != null ? 83.w : 90.w,
              child: TextField(
                controller: _controller,
                onChanged: (value) {
                  setState(() {
                    valueToSearch = value;
                  });
                },
                onSubmitted: (value) {
                  setState(() {
                    isLoading = true;
                  });
                  valueToSearch = value;
                  _bloc.add(SearchGifEvent(toSearch: valueToSearch!));
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  icon: Icon(Icons.search),
                ),
              ),
            ),
            Spacer(),
            valueToSearch != '' && valueToSearch != null
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _controller.clear();
                        valueToSearch = null;
                      });
                    },
                    icon: Icon(Icons.close),
                  )
                : Container()
          ],
        ),
      );

  Widget get noResult => Container(
        height: 60.h,
        margin: EdgeInsets.only(top: 20),
        child: Center(
          child: Text(
            'No results',
            style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey,
                fontWeight: FontWeight.bold),
          ),
        ),
      );

  Widget searchAnswer({required SearchResponse gifs}) => Column(
        children: [
          SizedBox(
            height: 80.h,
            child: ListView.builder(
              itemCount: gifs.data.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      gifs.data[index].images.downsized.url,
                      fit: BoxFit.cover,
                      height:
                          double.parse(gifs.data[index].images.original.height),
                      width: 20.w,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );

  Widget listGif({required List<Datum> gifs}) => Expanded(
        child: ListView.builder(
          itemCount: gifs.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  gifs[index].images.downsized.url,
                  fit: BoxFit.cover,
                  height: double.parse(gifs[index].images.original.height),
                  width: 20.w,
                ),
              ),
            );
          },
        ),
      );
}
