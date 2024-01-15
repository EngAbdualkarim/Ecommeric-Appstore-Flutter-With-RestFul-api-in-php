
import 'package:ecommericappstore/core/constant/routesname.dart';
import 'package:ecommericappstore/core/localization/changelocal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/classes/statusrequest.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../data/datasource/remote/auth/signup_data.dart';

abstract class SignupController extends GetxController {
  signUp();
  goToSigIn();
}

class SignupControllerImp extends SignupController {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  GlobalKey<FormState> formstate=GlobalKey<FormState>();
  StatusRequest? statusRequest=StatusRequest.none;
  SigupData sigupData=SigupData(Get.find());

  List data=[];
  @override
  void onInit() {
    username=TextEditingController();
    email = TextEditingController();
    phone=TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  signUp() async{

    if(formstate.currentState!.validate()){
      statusRequest=StatusRequest.loading;
      update();
      var response=await sigupData.postData(username.text, password.text, email.text, phone.text);
      statusRequest=handlingData(response);
      if(StatusRequest.success==statusRequest){
        if(response['status']=='success') {
          //data.addAll(response['data']);
          Get.offNamed(AppRoute.verfiyCodeSignUp,arguments: {
            "email":email.text
          });
        }
        else{
          Get.defaultDialog(title:"Warning",middleText: "Phone Number Or Email Is Already Exist" );
          statusRequest=StatusRequest.failure;
        }
      }
      update();
    }else{}

  }

  @override
  goToSigIn() {
    Get.offNamed(AppRoute.login);
  }

  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
