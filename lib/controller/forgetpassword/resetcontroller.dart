import 'package:ecommericappstore/core/constant/routesname.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/classes/statusrequest.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../data/datasource/remote/forgetpassword/resetpassword_data.dart';

abstract class ResetCodeController extends GetxController {
  resetPassword();
  goToSuccessResetPassword();
}

class ResetCodeControllerImp extends ResetCodeController {
  late TextEditingController password;
  late TextEditingController rePassword;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  ResetPasswordForgetPasswordData resetPasswordForgetPasswordData = ResetPasswordForgetPasswordData(Get.find());
  StatusRequest? statusRequest=StatusRequest.none;
  String? email;
  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    rePassword = TextEditingController();
    super.onInit();
  }

  @override
  goToSuccessResetPassword() async {
    if (password.text != rePassword.text) {
      return Get.defaultDialog(
          title: "Warning", middleText: "Password Not Match");
    }
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await resetPasswordForgetPasswordData.postData(email!, password.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          //data.addAll(response['data']);
          Get.offNamed(AppRoute.succeesResetPasword);
        } else {
          Get.defaultDialog(
              title: "Warning", middleText: "Try Again Later");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("not valid");
    }
  }

  resetPassword() {}

  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }
}
