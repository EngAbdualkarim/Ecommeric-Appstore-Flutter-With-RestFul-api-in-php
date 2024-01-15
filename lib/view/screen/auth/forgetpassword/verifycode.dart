import 'package:ecommericappstore/controller/forgetpassword/verifycontroller.dart';
import 'package:ecommericappstore/core/constant/colors.dart';
import 'package:ecommericappstore/view/widgets/auth/customtextbodyauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../../controller/forgetpassword/forgetpasswordcontroller.dart';
import '../../../../core/classes/handling_data_view.dart';
import '../../../widgets/auth/customtextformfieldauth.dart';
import '../../../widgets/auth/customtexttitleauth.dart';
import '../../../widgets/auth/customtexttitleauth.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Verification Code",
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: GetBuilder<VerifyCodeControllerImp>(builder: (controller)=>
    HandlingDataRequest(
    statusRequest: controller.statusRequest!,
    widget:Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
          child: ListView(
            children: [
              const SizedBox(
                height: 9,
              ),
              const CustomTextTitleAuth(
                text: "Check Code",
              ),
              const SizedBox(
                height: 9,
              ),
              const CustomTextBodyAuth(
                  text:
                      "Please Enter The Digit Code Sent To example@gmail.com"),
              const SizedBox(
                height: 12,
              ),
              OtpTextField(
                fieldWidth: 50,
                borderRadius: BorderRadius.circular(20),
                numberOfFields: 5,
                borderColor: Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  controller.goToResetPasswod(verificationCode);
                }, // end onSubmit
              ),
            ],
          )),),),
    );
  }
}
