enum Weather {
  clear,
  cloudy,
  rainy,
  stormy,
  sunny,
  tornado,
  windy;

  @override
  String toString() {
    switch (this) {
      case clear:
        return "Clear";
      case cloudy:
        return "Cloudy";
      case rainy:
        return "Mid Rain";
      case stormy:
        return "Showers";
      case sunny:
        return "Sunny";
      case tornado:
        return "Tornado";
      case windy:
        return "Fast Wind";
    }
  }
}

enum ForecastPeriod { hourly, daily }

class ForecastModel {
  late DateTime date;
  late Weather weather;
  late int probability;
  late int temperature;
  late int high;
  late int low;
  late String location;
  late String icon;

  ForecastModel(
    this.date,
    this.weather,
    this.probability,
    this.temperature,
    this.high,
    this.low,
    this.location,
  ) {
    switch (weather) {
      case Weather.clear:
        icon = "moon.png";
        break;
      case Weather.cloudy:
        icon = "cloud.png";
        break;
      case Weather.rainy:
        icon = "moon_cloud_mid_rain.png";
        break;
      case Weather.stormy:
        icon = "sun_cloud_angled_rain.png";
        break;
      case Weather.sunny:
        icon = "sun.png";
        break;
      case Weather.tornado:
        icon = "tornado.png";
        break;
      case Weather.windy:
        icon = "moon_cloud_fast_wind.png";
        break;
    }
  }
}

class Forecast {
  static List<ForecastModel> hourly = [
    ForecastModel(DateTime.now().add(const Duration(hours: -1)), Weather.rainy,
        30, 19, 24, 18, "Montreal Canada"),
    ForecastModel(
        DateTime.now(), Weather.rainy, 0, 19, 24, 18, "Montreal Canada"),
    ForecastModel(DateTime.now().add(const Duration(hours: 1)), Weather.windy,
        0, 18, 24, 18, "Montreal Canada"),
    ForecastModel(DateTime.now().add(const Duration(hours: 2)), Weather.rainy,
        0, 19, 24, 18, "Montreal Canada"),
    ForecastModel(DateTime.now().add(const Duration(hours: 3)), Weather.rainy,
        0, 19, 24, 18, "Montreal Canada"),
    ForecastModel(DateTime.now().add(const Duration(hours: 4)), Weather.rainy,
        0, 19, 24, 18, "Montreal Canada"),
  ];

  static List<ForecastModel> daily = [
    ForecastModel(
        DateTime.now(), Weather.rainy, 30, 19, 24, 18, "Montreal Canada"),
    ForecastModel(DateTime.now().add(const Duration(days: 1)), Weather.rainy, 0,
        19, 24, 18, "Montreal Canada"),
    ForecastModel(DateTime.now().add(const Duration(days: 2)), Weather.stormy,
        100, 19, 24, 18, "Montreal Canada"),
    ForecastModel(DateTime.now().add(const Duration(days: 3)), Weather.stormy,
        50, 19, 24, 18, "Montreal Canada"),
    ForecastModel(DateTime.now().add(const Duration(days: 4)), Weather.rainy, 0,
        19, 24, 18, "Montreal Canada"),
    ForecastModel(DateTime.now().add(const Duration(days: 5)), Weather.rainy, 0,
        19, 24, 18, "Montreal Canada"),
  ];

  static List<ForecastModel> citie = [
    ForecastModel(
        DateTime.now(), Weather.rainy, 0, 19, 24, 18, "Montreal, Canada"),
    ForecastModel(
        DateTime.now(), Weather.windy, 0, 20, 21, 19, "Toronto, Canada"),
    ForecastModel(DateTime.now(), Weather.stormy, 0, 13, 16, 8, "Tokyo, Japan"),
    ForecastModel(DateTime.now(), Weather.tornado, 0, 23, 26, 16,
        "Tennessee, United States")
  ];
}
