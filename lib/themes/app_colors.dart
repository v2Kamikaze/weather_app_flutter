import 'package:flutter/material.dart';

class AppColors {
  static Color background1 = const Color(0xFF2E335A);
  static Color background2 = const Color(0xFF331B5A);
  static Color backgroundForecast = const Color(0xFF48319D);
  static Color probabilityTextColor = const Color(0xFF40CBD8);
  static Color tabBarBackground1 = const Color(0xFF3A3A6A);
  static Color tabBarBackground2 = const Color(0xFF25244C);
  static Color tabBarBorder = const Color(0xFF7582F4);
  static Color tabBarBorderWithOpacity =
      const Color(0xFF7582F4).withOpacity(0.5);
  static Color weatherWidgetBackground1 = const Color(0xFF5936B4);
  static Color weatherWidgetBackground2 = const Color(0xFF362A84);

  static LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [background1, background2],
  );

  static LinearGradient bottomSheetGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [background1.withOpacity(0.26), background2.withOpacity(0.26)],
  );

  static LinearGradient navBarGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [background1.withOpacity(0.1), background2.withOpacity(0.1)],
  );

  static LinearGradient tabBarGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      tabBarBackground1.withOpacity(0.26),
      tabBarBackground2.withOpacity(0.26)
    ],
  );

  static LinearGradient weatherWidgetGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      weatherWidgetBackground1,
      weatherWidgetBackground2,
    ],
  );
}
