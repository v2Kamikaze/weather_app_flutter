import 'package:flutter/material.dart';
import 'package:weather_app/components/weather_item.dart';
import 'package:weather_app/models/forecast_model.dart';

class WeatherCitieList extends StatelessWidget {
  const WeatherCitieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: Forecast.citie
            .map(
              (fc) => Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: WeatherItem(fc),
              ),
            )
            .toList(),
      ),
    );
  }
}
