import 'package:flutter/material.dart';
import 'package:summer_test/src/pages/home/home.dart';

Map<String, Widget Function(BuildContext)> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
};
