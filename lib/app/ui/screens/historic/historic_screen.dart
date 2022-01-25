import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/color_theme.dart';
import '../../../controller/index.dart';
import '../../components/components.dart';

class HistoricScreen extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorTheme.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("RaroLabs Parking",
                  style: TextStyle(color: ColorTheme.primaryColor))
            ],
          ),
          elevation: 1,
        ),
        body: HistoricTemplate(
          controller: controller,
        ));
  }
}
