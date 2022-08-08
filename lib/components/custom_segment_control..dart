import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/components/forecast_item.dart';
import 'package:weather_app/models/forecast_model.dart';
import 'package:weather_app/themes/app_colors.dart';

class CustomSegmentedControl extends StatefulWidget {
  const CustomSegmentedControl({Key? key}) : super(key: key);

  @override
  State<CustomSegmentedControl> createState() => _CustomSegmentedControlState();
}

class _CustomSegmentedControlState extends State<CustomSegmentedControl> {
  final double _minTextOpacity = 0.4;

  bool _firstChildSelected = true;
  double _firstChildOpacity = 1.0;
  double _secondChildOpacity = 0.4;

  final TextStyle style = GoogleFonts.roboto(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned(
          top: 10,
          child: Container(
            height: 5,
            width: 48,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Positioned(
          top: 30,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: onTapFirstChild,
                    child: AnimatedOpacity(
                      opacity: _firstChildOpacity,
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 200),
                      child: Text(
                        "Hourly Forecast",
                        style: style,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: onTapSecondChild,
                    child: AnimatedOpacity(
                      opacity: _secondChildOpacity,
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 200),
                      child: Text(
                        "Weekly Forecast",
                        style: style,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                height: 2.5,
                width: MediaQuery.of(context).size.width,
                child: AnimatedContainer(
                  curve: Curves.bounceInOut,
                  alignment: _firstChildSelected
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  duration: const Duration(milliseconds: 350),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          AppColors.background1.withOpacity(0.01),
                          Colors.white.withOpacity(0.9),
                          AppColors.background1.withOpacity(0.01),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 70,
          height: 165,
          width: MediaQuery.of(context).size.width,
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: Forecast.hourly.map((forecast) {
                      return ForecastItem(
                        forecast: forecast,
                        forecastPeriod: ForecastPeriod.hourly,
                      );
                    }).toList(),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: Forecast.daily.map((forecast) {
                      return ForecastItem(
                        forecast: forecast,
                        forecastPeriod: ForecastPeriod.daily,
                      );
                    }).toList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  void onTapFirstChild() {
    setState(() {
      _firstChildSelected = true;
      _firstChildOpacity = 1.0;
      _secondChildOpacity = _minTextOpacity;
      _pageController.animateToPage(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.decelerate,
      );
    });
  }

  void onTapSecondChild() {
    setState(() {
      _firstChildSelected = false;
      _firstChildOpacity = _minTextOpacity;
      _secondChildOpacity = 1.0;
      _pageController.animateToPage(
        1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.decelerate,
      );
    });
  }
}
