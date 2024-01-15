

import 'package:ecommericappstore/core/constant/routesname.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController{
  goToLogin();
}
class SuccessSignUpControllerImp extends SuccessSignUpController{
  goToLogin(){
    Get.offAllNamed(AppRoute.login);
  }
}


