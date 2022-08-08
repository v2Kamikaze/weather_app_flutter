import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/canvas/bottom_bar_arc_border.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar(
      {Key? key,
      required this.expandedOnPressed,
      required this.navigatorOnPressed})
      : super(key: key);

  final VoidCallback expandedOnPressed;
  final VoidCallback navigatorOnPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          painter: CustomBottomNavigationBarArcPainter(),
          child: Container(),
        ),
        Positioned(
          bottom: 0.0,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(32, 20, 32, 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: expandedOnPressed,
                  icon: const Icon(
                    CupertinoIcons.map_pin_ellipse,
                    size: 28,
                  ),
                ),
                IconButton(
                  onPressed: navigatorOnPressed,
                  icon: const Icon(
                    CupertinoIcons.list_bullet,
                    size: 28,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
