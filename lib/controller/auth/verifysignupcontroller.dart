



import 'package:get/get.dart';

import '../../core/classes/statusrequest.dart';
import '../../core/constant/routesname.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../data/datasource/remote/auth/verifycode_signup_data.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verifCode);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {


  String? email;
  StatusRequest? statusRequest=StatusRequest.none;
  VerifyCodeSigupData verifyCodeSigupData=VerifyCodeSigupData(Get.find());

  @override
  void onInit() {
    email=Get.arguments['email'];
    super.onInit();
  }

  goToSuccessSignUp(String verifCode)async{
    statusRequest=StatusRequest.loading;
    update();
    var response=await verifyCodeSigupData.postData(email!,verifCode);
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=='success') {
        Get.offNamed(AppRoute.succeesSignUp);
      }
      else{
        Get.defaultDialog(title:"Warning",middleText: "Verify Code Not Correct" );
        statusRequest=StatusRequest.failure;
      }
    }
    update();

  }


  @override
  checkCode() {

  }


  void dispose() {
    super.dispose();
  }

}
