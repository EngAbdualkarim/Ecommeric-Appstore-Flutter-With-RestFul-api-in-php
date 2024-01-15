import 'package:ecommericappstore/controller/auth/logincontroller.dart';
import 'package:ecommericappstore/core/constant/colors.dart';
import 'package:ecommericappstore/view/widgets/auth/customtextbodyauth.dart';
import 'package:flutter/material.dart';

import '../../../core/classes/handling_data_view.dart';
import '../../../core/functions/alertexit.dart';
import '../../../core/functions/validinput.dart';
import '../../widgets/auth/customtextformfieldauth.dart';
import '../../widgets/auth/customtexttitleauth.dart';
import '../../widgets/auth/logoauth.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign In",
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest!,
            widget: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      const LogoAuth(),
                      const SizedBox(
                        height: 13,
                      ),
                      const CustomTextTitleAuth(
                        text: "Wellcome Back",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const CustomTextBodyAuth(
                          text:
                              "Sign In With Your Email And Password Or Continue With Social Media"),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextFormFieldAuth(
                        valid: (val) {
                          return validInput(val!, 5, 100, "email");
                        },
                        isNumber: false,
                        hintText: "Enter Your email",
                        iconData: Icons.person_outlined,
                        labelText: "Email",
                        myController: controller.email,
                      ),
                      GetBuilder<LoginControllerImp>(
                          builder: (controller) => Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  validator: (val) {
                                    return validInput(val!, 3, 30, "password");
                                  },
                                  controller: controller.password,
                                  obscureText: controller.isShowPassword,
                                  decoration: InputDecoration(
                                    hintText: "Enter Your Password",
                                    hintStyle: const TextStyle(fontSize: 13),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 20),
                                    label: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 9),
                                        child: Text(
                                          "Password",
                                        )),
                                    suffixIcon: InkWell(
                                        onTap: () {
                                          controller.showPassword();
                                        },
                                        child: Icon(Icons.lock_outline)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                              )),
                      InkWell(
                        onTap: () {
                          controller.goToForgetPassword();
                        },
                        child: const Text(
                          "Forget Password",
                          textAlign: TextAlign.end,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          onPressed: () {
                            controller.login();
                          },
                          textColor: Colors.white,
                          color: Colors.orange,
                          child: const Text("Sign In"),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            " Don't have an account ?",
                          ),
                          InkWell(
                            onTap: () {
                              controller.goToSignup();
                            },
                            child: Text(
                              " Sign Up",
                              style: const TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
