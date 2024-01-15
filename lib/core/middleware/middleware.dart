
import 'package:ecommericappstore/core/constant/routesname.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/services.dart';

class MyMiddleWare extends GetMiddleware{

  int? get priority=>1;
  MyServices myServices=Get.find();

  @override
  RouteSettings? redirect(String? route){

    if(myServices.sharedPreferences.getString("step")=="2") {
      return RouteSettings(name: AppRoute.homepage);
    }
    if(myServices.sharedPreferences.getString("step")=="1"){
      return RouteSettings(name: AppRoute.login);
    }

  }

}