import 'package:flutter/material.dart';
import 'package:weather_app/components/custom_bottom_navigation_bar.dart';
import 'package:weather_app/components/glass.dart';
import 'package:weather_app/pages/weather_page.dart';
import 'package:weather_app/themes/app_colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final double sliderMaxHeight = 680;
  final double sliderMinHeight = 330;
  double sliderHeight = 340;

  final double beginBackgroundPosition = 0;
  final double beginHousePosition = 300;
  double backgroundPositon = 0;
  double housePosition = 300;

  final double beginBottomNavigationBarPosition = 0;
  double bottomNavigationBarPosition = 0;

  final double beginFontSizeTemperature = 92;
  final double minFontSizeTemperature = 20;
  double fontSizeTemperature = 92;

  final double maxOpacityText = 1.0;
  double textOpacity = 1.0;

  double forecastWidgetsOpacity = 0.0;
  final double forecastWidgetsPosition = 260;

  final double beginLocationPosition = 80;
  final double minLocationPosition = 20;
  double locationPosition = 80;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Container(
        clipBehavior: Clip.none,
        width: screenSize.width,
        height: screenSize.height,
        decoration: BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: SafeArea(
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              AnimatedPositioned(
                top: backgroundPositon,
                duration: const Duration(milliseconds: 350),
                child: Image.asset(
                  "assets/images/background.png",
                  fit: BoxFit.cover,
                ),
              ),
              AnimatedPositioned(
                top: housePosition,
                width: screenSize.width,
                duration: const Duration(milliseconds: 350),
                child: Image.asset(
                  "assets/images/house.png",
                  fit: BoxFit.cover,
                ),
              ),
              AnimatedPositioned(
                top: locationPosition,
                duration: const Duration(milliseconds: 350),
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Montreal",
                          style: textTheme.headline2,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "19°",
                            style: fontSizeTemperature == minFontSizeTemperature
                                ? textTheme.headline1!.copyWith(
                                    fontSize: fontSizeTemperature,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white.withOpacity(0.6),
                                  )
                                : textTheme.headline1!.copyWith(
                                    fontSize: fontSizeTemperature,
                                    letterSpacing: -2,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.white,
                                  ),
                            children: [
                              TextSpan(
                                text: sliderHeight == sliderMaxHeight
                                    ? " | Mostly Clear"
                                    : "\nMostly Clear",
                                style: textTheme.headline3!.copyWith(
                                  letterSpacing: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 150),
                            opacity: textOpacity,
                            child: Text(
                              "H:24°   L:18°",
                              style: fontSizeTemperature ==
                                      minFontSizeTemperature
                                  ? textTheme.headline4!.copyWith(fontSize: 0.0)
                                  : textTheme.headline4,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              AnimatedPositioned(
                bottom: 0.0,
                height: sliderHeight,
                duration: const Duration(milliseconds: 100),
                child: GestureDetector(
                  onPanUpdate: _slide,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Glass(opacity: forecastWidgetsOpacity),
                    ],
                  ),
                ),
              ),
              AnimatedPositioned(
                width: MediaQuery.of(context).size.width,
                height: 150.0,
                bottom: bottomNavigationBarPosition,
                duration: const Duration(milliseconds: 200),
                child: CustomBottomNavigationBar(
                  navigatorOnPressed: () {
                    Navigator.of(context).push(_goToWeather());
                  },
                  expandedOnPressed: () {
                    setState(() {
                      sliderHeight = sliderMaxHeight;
                      fontSizeTemperature = minFontSizeTemperature;
                      locationPosition = minLocationPosition;
                      backgroundPositon -= sliderHeight * 1.5;
                      housePosition -= sliderHeight * 1.5;
                      forecastWidgetsOpacity = 1;
                      bottomNavigationBarPosition -= sliderHeight / 2;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _slide(DragUpdateDetails details) {
    setState(() {
      double delta = details.delta.dy;

      if (sliderHeight - delta >= sliderMaxHeight) {
        sliderHeight = sliderMaxHeight;
        fontSizeTemperature = minFontSizeTemperature;
        locationPosition = minLocationPosition;
      } else if (sliderHeight - delta <= sliderMinHeight) {
        // Deixando todos em seus valores iniciais.
        sliderHeight = sliderMinHeight;
        backgroundPositon = beginBackgroundPosition;
        housePosition = beginHousePosition;
        bottomNavigationBarPosition = beginBottomNavigationBarPosition;
        fontSizeTemperature = beginFontSizeTemperature;
        textOpacity = maxOpacityText;
        forecastWidgetsOpacity = 0.0;
        locationPosition = beginLocationPosition;
      } else {
        sliderHeight -= delta;
        backgroundPositon += delta * 2.9;
        housePosition += delta * 2.9;
        bottomNavigationBarPosition += delta;
        fontSizeTemperature += delta * 0.18;
        textOpacity = calcTextOpacity(textOpacity, delta);
        forecastWidgetsOpacity = calcForecastWidgetsOpacity();
        locationPosition += delta * 0.2;
      }
    });
  }

  double calcTextOpacity(double currentValue, double delta) {
    return ((sliderHeight - sliderMaxHeight) / sliderMaxHeight)
        .abs()
        .clamp(0.0, 1.0);
  }

  double calcForecastWidgetsOpacity() {
    return 1 -
        ((sliderHeight - sliderMaxHeight) / sliderHeight).abs().clamp(0.0, 1.0);
  }

  Route _goToWeather() {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => const WeatherPage(),
      transitionsBuilder: (_, animation, __, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
