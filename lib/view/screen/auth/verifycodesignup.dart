import 'package:ecommericappstore/core/constant/colors.dart';
import 'package:ecommericappstore/view/widgets/auth/customtextbodyauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../controller/auth/verifysignupcontroller.dart';
import '../../../core/classes/handling_data_view.dart';
import '../../widgets/auth/customtexttitleauth.dart';


class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
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
      body: GetBuilder<VerifyCodeSignUpControllerImp>(builder: (controller)=>
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
                  controller.goToSuccessSignUp(verificationCode);
                }, // end onSubmit
              ),
            ],
          )),),),
    );
  }
}
