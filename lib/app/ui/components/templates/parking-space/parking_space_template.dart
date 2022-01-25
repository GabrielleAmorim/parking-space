import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components.dart';
import '../../../../controller/index.dart';
import '../../../theme/responsive_theme.dart';
import '../../../theme/color_theme.dart';

class ParkingSpaceTemplate extends StatelessWidget {
  final HomeController controller;

  ParkingSpaceTemplate({required this.controller});

  Widget _filled(String label, int index, int list) {
    return FilledParkingCard(
        onTap: () {
          Get.bottomSheet(Material(
            borderRadius:
                BorderRadius.all(Radius.circular(Responsive.radius(16))),
            child: SizedBox(
                height: Get.height * .4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Confirmar saída da vaga $label?",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: Responsive.setFontSize(20))),
                    SizedBox(height: Responsive.setHeight(40)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Container(
                            width: Get.width * .4,
                            height: Responsive.setHeight(30),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(Responsive.radius(8)))),
                            child: const Center(
                              child: Text("Cancelar",
                                  style: TextStyle(
                                      color: ColorTheme.primaryColor)),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.unfillParking(
                                list == 0
                                    ? controller.parkingA[index]
                                    : controller.parkingB[index],
                                index,
                                list);
                            Get.back();
                          },
                          child: Container(
                            padding:
                                EdgeInsets.only(left: Responsive.radius(10)),
                            child: Container(
                              width: Get.width * .4,
                              height: Responsive.setHeight(30),
                              decoration: BoxDecoration(
                                  color: ColorTheme.primaryColor,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(Responsive.radius(8)))),
                              child: const Center(
                                child: Text("Confirmar",
                                    style: TextStyle(color: ColorTheme.white)),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )),
          ));
        },
        label: label,
        carLicense: list == 0
            ? controller.parkingA[index].carLicense
            : controller.parkingB[index].carLicense);
  }

  Widget _empty(String label, int index, int list) {
    return EmptyParkingCard(
        onTap: () {
          Get.bottomSheet(Material(
            borderRadius:
                BorderRadius.all(Radius.circular(Responsive.radius(16))),
            child: SizedBox(
                height: Get.height * .4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Informe a placa do carro: ",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: Responsive.setFontSize(20))),
                    SizedBox(
                      width: Responsive.setWidth(250),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorTheme.primaryColor),
                          ),
                        ),
                        controller: controller.carLicenseController,
                      ),
                    ),
                    SizedBox(height: Responsive.setHeight(40)),
                    GestureDetector(
                      onTap: () {
                        controller.fillParking(
                            list == 0
                                ? controller.parkingA[index]
                                : controller.parkingB[index],
                            index,
                            list,
                            controller.carLicenseController.text);
                        controller.carLicenseController.clear();
                        Get.back();
                      },
                      child: Container(
                        width: Responsive.setWidth(250),
                        height: Responsive.setHeight(30),
                        decoration: BoxDecoration(
                            color: ColorTheme.primaryColor,
                            borderRadius: BorderRadius.all(
                                Radius.circular(Responsive.radius(8)))),
                        child: const Center(
                          child: Text("Concluir",
                              style: TextStyle(color: ColorTheme.white)),
                        ),
                      ),
                    )
                  ],
                )),
          ));
        },
        label: label);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * 2,
      color: Colors.grey[200],
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Obx(() => Container(
                    padding: EdgeInsets.only(
                        top: Responsive.radius(20),
                        left: Responsive.radius(20)),
                    child: InformationCard(
                        firstLabel: "Disponíveis",
                        secondLabel: controller.available.value.toString()))),
                Obx(() => Container(
                    padding: EdgeInsets.only(
                        top: Responsive.radius(20),
                        right: Responsive.radius(20)),
                    child: InformationCard(
                        firstLabel: "Ocupadas",
                        secondLabel: controller.fill.value.toString())))
              ],
            ),
            WarningCard(
              message:
                  "Para registrar entrada ou saída de veículos, clique na vaga desejada e confirme a operação.",
              borderColor: Colors.grey[400]!,
            ),
            SizedBox(height: Responsive.setHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => SizedBox(
                      height: Get.height * 1.2,
                      width: Get.width * 0.4,
                      child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                !controller.parkingA[index].isFilled
                                    ? _empty("A${index + 1}", index, 0)
                                    : _filled("A${index + 1}", index, 0)
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: Responsive.setHeight(10));
                          },
                          itemCount: controller.parkingA.length),
                    )),
                Obx(() => SizedBox(
                      height: Get.height * 1.2,
                      width: Get.width * 0.4,
                      child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                !controller.parkingB[index].isFilled
                                    ? _empty("B${index + 1}", index, 1)
                                    : _filled("B${index + 1}", index, 1)
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: Responsive.setHeight(10));
                          },
                          itemCount: controller.parkingB.length),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
