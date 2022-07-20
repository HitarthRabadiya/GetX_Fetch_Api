import 'package:fetch_api_getx/Screens/profile.dart';
import 'package:get/get.dart';

class Profilecontroller extends GetxController {

  String id = "";
  String name = "";
  String email = "";
  String mobile = "";
  String adr = "";
  String gender = "";
  String role = "";
  String salary = "";
  String pass = "";
  String img = "";
  String date = "";
  String joining = "";


  @override
  void onInit() {
    if(Get.arguments!=null){
      id = Get.arguments["id"];
      name = Get.arguments["name"];
      email = Get.arguments["email"];
      mobile = Get.arguments["mobile"];
      adr = Get.arguments["adr"];
      gender = Get.arguments["gender"];
      role = Get.arguments["role"];
      salary = Get.arguments["salary"];
      pass = Get.arguments["pass"];
      img = Get.arguments["img"];
      date = Get.arguments["date"];
      joining = Get.arguments["joining"];
    }
    super.onInit();
  }
}
