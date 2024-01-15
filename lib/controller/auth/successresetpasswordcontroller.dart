

import 'package:ecommericappstore/core/constant/routesname.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController{
goToLogin();
}
class SuccessResetPasswordControllerImp extends SuccessResetPasswordController{
  goToLogin(){
    Get.offAllNamed(AppRoute.login);
  }
}
