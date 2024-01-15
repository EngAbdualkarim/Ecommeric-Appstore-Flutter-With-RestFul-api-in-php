
import 'package:ecommericappstore/core/classes/statusrequest.dart';
import 'package:ecommericappstore/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/test_data_controller.dart';
import '../core/classes/handling_data_view.dart';

class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());

    return Scaffold(
      appBar: AppBar(title: Text("Test",),
      backgroundColor: AppColor.primaryColor,),
      body: GetBuilder<TestController>(
        builder: (controller){
          return HandlingDataView(statusRequest:controller.statusRequest,widget:ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context,index){
                return Text("${controller.data}");
              }));
        },
      ),
    );
  }
}
