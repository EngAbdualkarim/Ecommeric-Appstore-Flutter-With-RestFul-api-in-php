import 'package:ecommericappstore/core/constant/colors.dart';
import 'package:ecommericappstore/view/widgets/auth/customtextbodyauth.dart';
import 'package:flutter/material.dart';
import '../../../../controller/forgetpassword/resetcontroller.dart';
import '../../../../core/classes/handling_data_view.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widgets/auth/customtextformfieldauth.dart';
import '../../../widgets/auth/customtexttitleauth.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reset Password",
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),//jgh865y6457
      body: GetBuilder<ResetCodeControllerImp>(builder: (controller)=>
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
                  text: "New Password",
                ),
                const SizedBox(
                  height: 9,
                ),
                const CustomTextBodyAuth(text: "Please Enter A New Password "),
                const SizedBox(
                  height: 12,
                ),
                CustomTextFormFieldAuth(
                  valid: (val){
                    return validInput(val!, 5, 30, "password");
                  },
                  myController: controller.password,
                  hintText: "Enter Your password",
                  iconData: Icons.email_outlined,
                  labelText: "Password", isNumber: false,
                ),
                CustomTextFormFieldAuth(
                  valid: (val){
                    return validInput(val!, 5, 30, "password");
                  },
                  isNumber: false,
                  myController: controller.rePassword,
                  hintText: "Re Enter Your Password",
                  iconData: Icons.email_outlined,
                  labelText: "Password",
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    onPressed: () {
                      controller.goToSuccessResetPassword();
                    },
                    textColor: Colors.white,
                    color: Colors.orange,
                    child: const Text("save"),
                  ),
                ),
              ],
            ),
          )),),),
    );
  }
}
