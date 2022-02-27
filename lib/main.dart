import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'global_locator.dart';
import 'src/pages/home/home.dart';
import 'src/utils/routes/routes.dart';

void main() {
  setUpGlobalLocator();

  WidgetsFlutterBinding.ensureInitialized();
  runApp(SummerTestApp());
}

class SummerTestApp extends StatelessWidget {
  const SummerTestApp();

  @override
  // ignore: prefer_const_constructors
  Widget build(BuildContext context) => Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: HomeScreen.routeName,
          routes: routes,
        ),
      );
}
