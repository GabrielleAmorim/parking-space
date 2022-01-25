import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

void main() {
  runApp(const RaroLabsParkingApp());
}

class RaroLabsParkingApp extends StatelessWidget {
  const RaroLabsParkingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'RaroLabs Parking',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        getPages: AppPages.pages,
        initialRoute: Routes.home);
  }
}
