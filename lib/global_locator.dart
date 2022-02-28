import 'package:get_it/get_it.dart';
import 'package:summer_test/src/repository/search_endpoint/search_repository.dart';

import 'src/repository/network/api_repository.dart';

late GetIt global;

void setUpGlobalLocator() {
  global = GetIt.I;
  global.registerLazySingleton<APIRepository>(() => DefaultAPIRepository());
  global.registerLazySingleton<GifRepository>(() => GifRepositoryDefault());
}
