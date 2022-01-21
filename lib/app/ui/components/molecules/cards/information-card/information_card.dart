import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../theme/color_theme.dart';
import '../../../../theme/responsive_theme.dart';

class InformationCard extends StatelessWidget {
  final String firstLabel;
  final String secondLabel;

  InformationCard({required this.firstLabel, required this.secondLabel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.35,
      height: Get.height * 0.14,
      decoration: BoxDecoration(
          color: ColorTheme.white,
          borderRadius: BorderRadius.all(Radius.circular(Get.width * 0.05))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(firstLabel,
                style: TextStyle(color: ColorTheme.primaryColor)),
          ),
          Container(
              padding: EdgeInsets.only(top: Responsive.radius(5)),
              child: Text(secondLabel,
                  style: TextStyle(
                      color: ColorTheme.primaryColor,
                      fontSize: Responsive.setFontSize(30))))
        ],
      ),
    );
  }
}
