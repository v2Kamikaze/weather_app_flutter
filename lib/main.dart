import 'package:flutter/material.dart';
import 'package:weather_app/pages/home.dart';
import 'package:weather_app/themes/app_themes.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Weather App",
      home: const Home(),
      theme: appTheme,
    );
  }
}
