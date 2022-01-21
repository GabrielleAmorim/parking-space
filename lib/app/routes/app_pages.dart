import 'package:get/get.dart';

import 'app_routes.dart';
import '../ui/screens/index.dart';
import '../bindings/index.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.home, page: () => HomeScreen(), bindings: [HomeBinding()]),
  ];
}
