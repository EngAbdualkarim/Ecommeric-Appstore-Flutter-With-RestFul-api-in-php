import 'package:ecommericappstore/core/constant/routesname.dart';
import 'package:ecommericappstore/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/classes/statusrequest.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../data/datasource/remote/auth/login_data.dart';

abstract class LoginController extends GetxController {
  login();

  goToSignup();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formstate=GlobalKey<FormState>();
  bool isShowPassword=true;
  StatusRequest? statusRequest=StatusRequest.none;
  LoginData loginData=LoginData(Get.find());
  MyServices myServices=Get.find();

  showPassword(){
    isShowPassword=isShowPassword==true?false:true;
    update();
  }


  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  login()async {
    if(formstate.currentState!.validate()){
      statusRequest=StatusRequest.loading;
      update();
      var response=await loginData.postData(email.text,password.text);
      statusRequest=handlingData(response);
      if(StatusRequest.success==statusRequest){
        if(response['status']=='success') {
          //data.addAll(response['data']);
          myServices.sharedPreferences.setString("id", response['data']['users_id'].toString());
          myServices.sharedPreferences.setString("username", response['data']['users_name'].toString());
          myServices.sharedPreferences.setString("email", response['data']['users_email'].toString());
          myServices.sharedPreferences.setString("phone", response['data']['password'].toString());
          myServices.sharedPreferences.setString("step","2");
          Get.offNamed(AppRoute.homepage);
        }
        else{
          Get.defaultDialog(title:"Warning",middleText: "Email Or Password Not Correct" );
          statusRequest=StatusRequest.failure;
        }
      }
      update();
    }else{}
  }

  @override
  goToSignup() {
    Get.offNamed(AppRoute.signup);
  }
  goToForgetPassword(){
    Get.toNamed(AppRoute.forgetPassword);
  }

  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
