
import 'package:ecommericappstore/core/constant/routesname.dart';
import 'package:ecommericappstore/data/datasource/remote/forgetpassword/checkemail_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/classes/statusrequest.dart';
import '../../core/functions/handling_data_controller.dart';

abstract class ForgetPasswordController extends GetxController {

  checkEmail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController email;
  GlobalKey<FormState> formstate=GlobalKey<FormState>();
  CheckEmailForgetPasswordData checkEmailForgetPasswordData= CheckEmailForgetPasswordData(Get.find());
  StatusRequest? statusRequest=StatusRequest.none;
  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }


  checkEmail()async{
    if(formstate.currentState!.validate()){
      statusRequest=StatusRequest.loading;
      update();
      var response=await checkEmailForgetPasswordData.postData(email.text);
      statusRequest=handlingData(response);
      if(StatusRequest.success==statusRequest){
        if(response['status']=='success') {
          //data.addAll(response['data']);
          Get.offNamed(AppRoute.verfiyCode,arguments:{
            "email":email.text
          } );
        }
        else{
          Get.defaultDialog(title:"Warning",middleText: "Email  Not Found" );
          statusRequest=StatusRequest.failure;
        }
      }
      update();
    }else{}
    }







  void dispose() {
    email.dispose();
    super.dispose();
  }

}
