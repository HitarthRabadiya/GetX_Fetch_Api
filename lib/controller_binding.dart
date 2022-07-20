import 'package:fetch_api_getx/controller/profile_controller.dart';
import 'package:get/get.dart';

import 'controller/controller.dart';

class ControllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<Controller>(Controller());
  }

}