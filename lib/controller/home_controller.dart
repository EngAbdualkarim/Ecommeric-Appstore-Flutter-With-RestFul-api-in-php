import 'package:ecommericappstore/core/services/services.dart';
import 'package:get/get.dart';
import 'package:ecommericappstore/core/classes/statusrequest.dart';

import '../core/functions/handling_data_controller.dart';
import '../data/datasource/remote/home_data.dart';

abstract class HomeController extends GetxController {
  intialData();

  getData();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  String? username;
  late StatusRequest statusRequest;
  List data=[];
  List categories=[];
  //List items=[];
  HomeData homeData = HomeData(Get.find());

  intialData() {
    username = myServices.sharedPreferences.getString("username");
  }

  @override
  void onInit() {
    getData();
    intialData();
    super.onInit();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        categories.addAll(response['categories']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
