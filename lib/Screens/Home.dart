import 'package:fetch_api_getx/Screens/profile.dart';
import 'package:fetch_api_getx/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get.lazyPut<Controller>(() => Controller());
    final controller = Get.find<Controller>();
    return Obx(() {
      return Scaffold(
        appBar: AppBar(centerTitle: true,title: Text("All Data"),),
        body:(controller.hasData.isFalse)?Center(child: CircularProgressIndicator(),): Center(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.UserList.length,
                    itemBuilder: (context, i) {
                      return InkWell(
                          onTap: () {
                            Get.to(Profile(),arguments: {
                              "id":controller.UserList[i].id,
                              "name":controller.UserList[i].name,
                              "email":controller.UserList[i].email,
                              "mobile":controller.UserList[i].mobile,
                              "adr":controller.UserList[i].adr,
                              "gender":controller.UserList[i].gender,
                              "role":controller.UserList[i].role,
                              "salary":controller.UserList[i].salary,
                              "pass":controller.UserList[i].pass,
                              "img":controller.UserList[i].img,
                              "date":controller.UserList[i].date,
                              "joining":controller.UserList[i].joining,
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                border: Border.all(),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15))),
                            child: ListTile(
                                leading: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                               "https://dsrsoftech.com/vishal/argon/img/${controller.UserList[i].img}"),
                                          fit: BoxFit.cover)),
                                ),
                                title: Mygetwidget (
                                    tital: "Name", data: "${controller.UserList[i].name}"),
                                subtitle: Mygetwidget(
                                    tital: "Email", data: "${controller.UserList[i].email}"),
                              trailing: IconButton(
                                onPressed: () async {
                                  await controller.deletuser(controller.UserList[i].email);
                                  controller.fetchAlbumData();
                                },
                                icon: Icon(Icons.delete),
                              ),
                                ),
                          ));
                    },
                  ),
                )
              ],
            )
        ),
      );
    });
  }
  Widget Mygetwidget({required String tital, required String data}) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 5),
      child: Text(
        "$tital:-$data",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
