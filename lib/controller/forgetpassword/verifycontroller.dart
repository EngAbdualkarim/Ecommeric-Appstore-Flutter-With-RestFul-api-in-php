
import 'package:ecommericappstore/core/constant/routesname.dart';
import 'package:get/get.dart';
import '../../core/classes/statusrequest.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../data/datasource/remote/forgetpassword/verifycode_data.dart';

abstract class VerifyCodeController extends GetxController {
  goToResetPasswod(String verifCode);
}

class VerifyCodeControllerImp extends VerifyCodeController {

  String? email;
  StatusRequest? statusRequest=StatusRequest.none;
  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData=VerifyCodeForgetPasswordData(Get.find());

  @override
  void onInit() {
    email=Get.arguments['email'];
    super.onInit();
  }

  goToResetPasswod(verifCode)async{
      statusRequest=StatusRequest.loading;
      update();
      var response=await verifyCodeForgetPasswordData.postData(email!,verifCode);
      statusRequest=handlingData(response);
      if(StatusRequest.success==statusRequest){
        if(response['status']=='success') {
          //data.addAll(response['data']);
          Get.offNamed(AppRoute.resetPassword,arguments: {
            "email":email
          });
        }
        else{
          Get.defaultDialog(title:"Warning",middleText:  "Verify Code Not Correct" );
          statusRequest=StatusRequest.failure;
        }
      }
      update();
  }



  void dispose() {

    super.dispose();
  }

}
