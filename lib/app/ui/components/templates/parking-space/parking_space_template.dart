import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components.dart';
import '../../../../controller/index.dart';
import '../../../theme/responsive_theme.dart';

class ParkingSpaceTemplate extends StatelessWidget {
  final HomeController controller;

  ParkingSpaceTemplate({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      color: Colors.grey[200],
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  padding: EdgeInsets.only(
                      top: Responsive.radius(30), left: Responsive.radius(20)),
                  child: InformationCard(
                      firstLabel: "Disponíveis",
                      secondLabel: controller.available.value.toString())),
              Container(
                  padding: EdgeInsets.only(
                      top: Responsive.radius(30), right: Responsive.radius(20)),
                  child: InformationCard(
                      firstLabel: "Ocupadas",
                      secondLabel: controller.fill.value.toString()))
            ],
          )
        ],
      ),
    );
  }
}
