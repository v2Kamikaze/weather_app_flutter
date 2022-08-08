import 'package:flutter/material.dart';
import 'package:weather_app/components/custom_navigation_bar.dart';
import 'package:weather_app/components/weather_citie_list.dart';
import 'package:weather_app/themes/app_colors.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(gradient: AppColors.backgroundGradient),
          child: ClipRect(
            child: Stack(
              alignment: Alignment.topCenter,
              children: const [
                Positioned.fill(
                  top: 130,
                  child: WeatherCitieList(),
                ),
                Positioned(
                  top: 0,
                  child: CustomNavigationBar(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
