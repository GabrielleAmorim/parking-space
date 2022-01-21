import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../theme/color_theme.dart';
import '../../../../../theme/responsive_theme.dart';

class FilledParkingCard extends StatelessWidget {
  final String label;
  final String carLicense;
  final VoidCallback onTap;

  FilledParkingCard(
      {required this.label, required this.carLicense, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: Get.width * 0.4,
          height: Get.height * 0.13,
          decoration: BoxDecoration(
              color: ColorTheme.primaryColor.withOpacity(.1),
              borderRadius:
                  BorderRadius.all(Radius.circular(Responsive.radius(8))),
              border:
                  Border.all(color: ColorTheme.primaryColor.withOpacity(.1))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Icon(Icons.directions_car,
                        color: ColorTheme.primaryColor,
                        size: Responsive.setFontSize(30)),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: Responsive.radius(10)),
                    child: Text(label,
                        style: TextStyle(
                            color: ColorTheme.primaryColor,
                            fontSize: Responsive.setFontSize(25))),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: Responsive.radius(8)),
                child: Text(carLicense,
                    style: TextStyle(
                        color: ColorTheme.primaryColor,
                        fontSize: Responsive.setFontSize(18))),
              ),
            ],
          )),
    );
  }
}
