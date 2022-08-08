import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/components/custom_segment_control..dart';
import 'package:weather_app/themes/app_colors.dart';

class Glass extends StatelessWidget {
  const Glass({Key? key, required this.opacity}) : super(key: key);

  final double opacity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height + 400,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            margin: const EdgeInsets.only(top: 2.5),
            decoration: BoxDecoration(
              color: AppColors.background1.withOpacity(0.6),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.1),
                  offset: const Offset(0, -2),
                )
              ],
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                const CustomSegmentedControl(),
                Positioned.fill(
                  top: 240,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Center(
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 350),
                        opacity: opacity,
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 13,
                            height: MediaQuery.of(context).size.height + 120,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                alignment: Alignment.topCenter,
                                fit: BoxFit.fitWidth,
                                filterQuality: FilterQuality.high,
                                image: AssetImage(
                                  "assets/images/forecast_widgets.png",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
