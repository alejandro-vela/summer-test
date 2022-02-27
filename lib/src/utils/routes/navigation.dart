import 'package:flutter/material.dart';
import 'package:summer_test/src/pages/home/home.dart';

// Home
navigateToHome(BuildContext context, bool remplaced) => remplaced
    ? Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext contextt) {
        return HomeScreen();
      }), (Route route) => false)
    : Navigator.of(context).pushNamed(HomeScreen.routeName);
