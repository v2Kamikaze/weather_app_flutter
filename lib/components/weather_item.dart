import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/models/forecast_model.dart';

class WeatherItem extends StatelessWidget {
  final ForecastModel forecast;
  const WeatherItem(
    this.forecast, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          AspectRatio(
            aspectRatio: 342 / 184,
            child: SvgPicture.asset(
              "assets/images/trapezoid.svg",
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: Text(
              "${forecast.temperature}°",
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: 64,
                letterSpacing: -1,
              ),
            ),
          ),
          Positioned(
            top: -25,
            right: 10,
            width: 180,
            height: 180,
            child: Image.asset(
              "assets/icons/large/${forecast.icon}",
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            left: 20,
            bottom: 25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "H:${forecast.high}°  L:${forecast.low}°",
                  style: GoogleFonts.roboto(
                    fontSize: 13,
                    color: const Color(0xFFEBEBF5).withOpacity(0.6),
                  ),
                ),
                Text(
                  forecast.location,
                  style: GoogleFonts.roboto(
                    color: const Color(0xFFEBEBF5),
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 50,
            bottom: 25,
            child: Text(
              forecast.weather.toString(),
              style: GoogleFonts.roboto(fontSize: 13),
            ),
          )
        ],
      ),
    );
  }
}
