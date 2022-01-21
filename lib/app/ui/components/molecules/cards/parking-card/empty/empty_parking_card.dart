import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../.././../../../theme/color_theme.dart';
import '../../../../../theme/responsive_theme.dart';

class EmptyParkingCard extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  EmptyParkingCard({
    required this.onTap,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Get.width * 0.4,
        height: Get.height * 0.13,
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular(Responsive.radius(8))),
            border: Border.all(color: Colors.grey[400]!)),
        child: Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.only(
              right: Responsive.radius(8), bottom: Responsive.radius(5)),
          child: Text(label,
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: Responsive.setFontSize(50))),
        ),
      ),
    );
  }
}
