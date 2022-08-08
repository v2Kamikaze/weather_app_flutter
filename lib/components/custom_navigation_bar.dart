import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/themes/app_colors.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.headline2;

    return SizedBox(
      height: 130,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(),
              ),
            ),
          ),
          Positioned(
            top: 20,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      padding: const EdgeInsets.only(bottom: 9),
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        CupertinoIcons.chevron_back,
                        size: 35,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "Weather",
                      style: textTheme!.copyWith(
                        fontSize: 30,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  padding: const EdgeInsets.only(bottom: 9),
                  constraints: const BoxConstraints(),
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.ellipsis_circle, size: 35),
                ),
              ],
            ),
          ),
          Positioned(
            top: 80,
            height: 40,
            width: MediaQuery.of(context).size.width * 0.9,
            child: CupertinoSearchTextField(
              placeholder: "Search for a city or airport",
              decoration: BoxDecoration(
                gradient: AppColors.bottomSheetGradient,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 2,
                  color: Colors.black.withOpacity(0.25),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
