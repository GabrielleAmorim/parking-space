import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../theme/color_theme.dart';
import '../../../../theme/responsive_theme.dart';

class WarningCard extends StatelessWidget {
  final String message;
  final Color borderColor;

  WarningCard(
      {required this.message, this.borderColor = ColorTheme.primaryColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.only(
          left: Responsive.radius(30),
          right: Responsive.radius(30),
          top: Responsive.radius(20)),
      child: Container(
        padding: EdgeInsets.all(Responsive.radius(10)),
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular(Responsive.radius(8))),
            border: Border.all(color: borderColor)),
        child: Text(message,
            style: TextStyle(
                color: Colors.grey[600], fontSize: Responsive.setFontSize(12))),
      ),
    );
  }
}
