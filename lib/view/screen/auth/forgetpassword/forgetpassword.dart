

import 'package:ecommericappstore/core/constant/colors.dart';
import 'package:ecommericappstore/view/widgets/auth/customtextbodyauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/forgetpassword/forgetpasswordcontroller.dart';
import '../../../../core/classes/handling_data_view.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widgets/auth/customtextformfieldauth.dart';
import '../../../widgets/auth/customtexttitleauth.dart';



class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forget Password",
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(builder: (controller)=>
    HandlingDataRequest(
    statusRequest: controller.statusRequest!,
    widget:Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
          child: Form(
            key: controller.formstate,
            child: ListView(
              children: [
                const SizedBox(
                  height: 9,
                ),
                const CustomTextTitleAuth(
                  text: "Check Email",
                ),
                const SizedBox(
                  height: 9,
                ),
                const CustomTextBodyAuth(
                    text:
                    "Please Enter Your Email Address To Recive Verification Code"),
                const SizedBox(
                  height: 12,
                ),
                CustomTextFormFieldAuth(
                  valid: (val){
                    return validInput(val!, 5, 100, "email");
                  },
                  isNumber: false,
                  myController: controller.email,
                  hintText: "Enter Your Email",
                  iconData: Icons.email_outlined,
                  labelText: "Email",
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    onPressed: () {
                      controller.checkEmail();
                    },
                    textColor: Colors.white,
                    color: Colors.orange,
                    child: const Text("Check"),
                  ),
                ),

              ],
            ),
          )),),),
    );
  }
}
