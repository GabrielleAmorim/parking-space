import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/date.dart';
import '../../../theme/color_theme.dart';
import '../../../../controller/index.dart';
import '../../../theme/responsive_theme.dart';

class HistoricTemplate extends StatelessWidget {
  final HomeController controller;

  HistoricTemplate({required this.controller});

  Widget _label(String label) {
    return Container(
      width: Get.width * 0.7,
      padding: EdgeInsets.only(left: Responsive.radius(15)),
      child: Text(label,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.grey[600], fontSize: Responsive.setFontSize(16))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width,
        height: Get.height,
        color: Colors.grey[200],
        child: Obx(
          () => ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: Responsive.radius(20),
                          left: Responsive.radius(16),
                          right: Responsive.radius(16)),
                      child: Container(
                        width: Get.width,
                        height: Responsive.setHeight(100),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(Responsive.radius(8))),
                            color: ColorTheme.white),
                        child: Row(
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.only(left: Responsive.radius(16)),
                              alignment: Alignment.centerLeft,
                              child: Icon(Icons.directions_car,
                                  color: ColorTheme.primaryColor,
                                  size: Responsive.setFontSize(30)),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _label(
                                    "Placa: ${controller.historic[index].carLicense}"),
                                _label(
                                    "Entrada: ${Date.formatDate(controller.historic[index].entryDate!)}"),
                                _label(
                                    "Saída: ${Date.formatDate(controller.historic[index].exitDate!)}"),
                                _label(
                                    "Vaga: ${controller.historic[index].label}")
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
              itemCount: controller.historic.length),
        ));
  }
}
