import 'package:fetch_api_getx/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends GetWidget<Profilecontroller> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Profilecontroller>(
        init: Profilecontroller(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(centerTitle:true,title: Text("Profile page"),),
            body: Center(
                child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top:15),
                  padding: EdgeInsets.only(top: 15),
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: NetworkImage("https://dsrsoftech.com/vishal/argon/img/${controller.img}"),fit: BoxFit.cover)),
                ),
                getMyWidget(title: "Name", data: "${controller.name}"),
                getMyWidget(title: "Email", data: "${controller.email}"),
                getMyWidget(title: "Phone", data: "${controller.mobile}"),
                getMyWidget(title: "Add", data: "${controller.adr}"),
                getMyWidget(title: "Gender", data: "${controller.gender}"),
                getMyWidget(title: "Role", data: "${controller.role}"),
                getMyWidget(title: "Salary", data: "${controller.salary}"),
                getMyWidget(title: "Pass", data: "${controller.pass}"),
                getMyWidget(title: "Date&time", data: "${controller.date}"),
                getMyWidget(title: "joining", data: "${controller.joining}"),
              ],
            )),
          );
        });
  }

  Widget getMyWidget({required String title, required String data}) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 100, top: 20),
          child: Text(
            "$title:-",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Text("$data"),
        ),
      ],
    );
  }
}
