import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/model.dart';

class HomeController extends GetxController {
  final available = 0.obs;
  final fill = 0.obs;
  final List<Parking> parkingA =
      <Parking>[Parking(), Parking(), Parking(), Parking(), Parking()].obs;
  final List<Parking> parkingB =
      <Parking>[Parking(), Parking(), Parking(), Parking(), Parking()].obs;
  final historic = <Parking>[].obs;

  final carLicenseController = TextEditingController();

  @override
  void onInit() {
    setValues();
    super.onInit();
  }

  void fillParking(Parking parking, int index, int list, String carLicense) {
    parking.isFilled = true;
    parking.carLicense = carLicense;
    parking.entryDate = DateTime.now();
    if (list == 0) {
      parkingA[index] = parking;
    } else {
      parkingB[index] = parking;
    }
    setValues();
  }

  void unfillParking(Parking parking, int index, int list) {
    Parking saved = Parking(
        carLicense: parking.carLicense,
        entryDate: parking.entryDate,
        exitDate: DateTime.now(),
        label: list == 0 ? "A${index + 1}" : "B${index + 1}");
    historic.add(saved);
    parking.isFilled = false;
    parking.exitDate = null;
    parking.carLicense = "";
    if (list == 0) {
      parkingA[index] = parking;
    } else {
      parkingB[index] = parking;
    }
    setValues();
  }

  void setValues() {
    available.value = 0;
    fill.value = 0;
    for (var item in parkingA) {
      if (item.isFilled) {
        fill.value += 1;
      } else {
        available.value += 1;
      }
    }
    for (var item in parkingB) {
      if (item.isFilled) {
        fill.value += 1;
      } else {
        available.value += 1;
      }
    }
  }
}
