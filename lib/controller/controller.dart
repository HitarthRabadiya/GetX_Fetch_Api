import 'dart:convert';
import 'package:fetch_api_getx/models/user_module.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Controller extends GetxController {
  var UserList = <user>[].obs;
  RxBool hasData  = false.obs;

  @override
  void onInit() {
    fetchAlbumData();
    super.onInit();
  }
  deletuser(email) async {
    var url = Uri.parse("https://dsrsoftech.com/vishal/argon/user_delet.php?email=$email");
    var response = await http.get(url);
  }
  Future<void> fetchAlbumData() async {
    UserList.clear();
    http.Response response = await http
        .get(Uri.parse("https://dsrsoftech.com/vishal/argon/get_all_users.php"))
        .catchError((error) {
      print("Error: $error");
    });
    print("Data := ${response.statusCode}");
    if (response.statusCode == 200) {
      hasData.value = true;
      print("Data := ${jsonDecode(response.body)}");
      
      List<dynamic> res = jsonDecode(response.body);
res.forEach((element) {
  UserList.add(user.fromJson(element));
  
});      
      print("My Data := ${UserList}");
    } else {
      hasData.value = true;
      Get.snackbar('Error Loding Data!',
          'Server responded:${response.statusCode}:${response.reasonPhrase.toString()}');
    }
  }
}
