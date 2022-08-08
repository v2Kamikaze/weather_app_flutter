import 'package:flutter/material.dart';
import 'package:weather_app/models/forecast_model.dart';
import 'package:weather_app/themes/app_colors.dart';

class ForecastItem extends StatelessWidget {
  ForecastItem({
    Key? key,
    required this.forecast,
    required this.forecastPeriod,
  }) : super(key: key);

  final ForecastModel forecast;
  final ForecastPeriod forecastPeriod;

  final Color colorActived = AppColors.backgroundForecast;

  bool get isActive {
    var now = DateTime.now();
    if (forecastPeriod == ForecastPeriod.hourly) {
      return forecast.date.year == now.year &&
          forecast.date.month == now.month &&
          forecast.date.day == now.day &&
          forecast.date.hour == now.hour;
    }
    return forecast.date.year == now.year &&
        forecast.date.month == now.month &&
        forecast.date.day == now.day;
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context)
        .textTheme
        .headline4!
        .copyWith(fontSize: 16, color: Colors.white);

    return Container(
      height: 146,
      width: 60,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35.0),
        color: isActive ? colorActived : colorActived.withOpacity(0.2),
        border: Border.all(
          width: 1,
          color: AppColors.tabBarBorder.withOpacity(isActive ? 0.5 : 0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(1, 1),
            blurRadius: 5,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 10.0),
          Text("${forecast.date.day}", style: style),
          const SizedBox(height: 15.0),
          Image.asset(
            "assets/icons/small/${forecast.icon}",
            height: 32,
            width: 32,
          ),
          Opacity(
            opacity: forecast.probability > 0 ? 1 : 0,
            child: Text(
              "${forecast.probability}%",
              style: style.copyWith(
                color: AppColors.probabilityTextColor,
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text("19°", style: style.copyWith(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
