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

  final carLicenseController = TextEditingController();

  @override
  void onInit() {
    setValues();
    super.onInit();
  }

  void fillParking(Parking parking, int index, int list, String carLicense) {
    parking.isFilled = true;
    parking.entryDate = DateTime.now();
    parking.carLicense = carLicense;
    if (list == 0) {
      parkingA[index] = parking;
    } else {
      parkingB[index] = parking;
    }
    setValues();
  }

  void unfillParking(Parking parking, int index, int list) {
    parking.isFilled = false;
    parking.entryDate = null;
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
