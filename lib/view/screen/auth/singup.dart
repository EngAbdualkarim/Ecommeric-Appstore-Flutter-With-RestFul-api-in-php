import 'package:ecommericappstore/core/constant/colors.dart';
import 'package:ecommericappstore/view/widgets/auth/customtextbodyauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/signupcontroller.dart';
import '../../../core/classes/handling_data_view.dart';
import '../../../core/functions/alertexit.dart';
import '../../../core/functions/validinput.dart';
import '../../widgets/auth/customtextformfieldauth.dart';
import '../../widgets/auth/customtexttitleauth.dart';


class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  Get.put(SignupControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body:WillPopScope(onWillPop: alertExitApp,
    child: GetBuilder<SignupControllerImp>(builder: (controller)=>
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
                text: "Wellcome Back",
              ),
              const SizedBox(
                height: 9,
              ),
              const CustomTextBodyAuth(
                  text:
                  "Sign Up With Your Email And Password etc.. Or Continue With Social Media"),
              const SizedBox(
                height: 12,
              ),
              CustomTextFormFieldAuth(
                valid: (val){
                  return validInput(val!, 5, 30, "username");
                },
                isNumber: false,
                myController: controller.username,
                hintText: "Enter Your name",
                iconData: Icons.person_outlined,
                labelText: "Username",
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
              CustomTextFormFieldAuth(
                valid: (val){
                  return validInput(val!, 5, 15, "phone");
                },
                isNumber: true,
                myController: controller.phone,
                hintText: "Enter Your Phone",
                iconData: Icons.email_outlined,
                labelText: "Phone",
              ),
              CustomTextFormFieldAuth(
                valid: (val){
                  return validInput(val!, 5, 30, "password");
                },
                isNumber: false,
                myController: controller.password,
                hintText: "Enter Your Password",
                iconData: Icons.lock_outline,
                labelText: "Password",
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  onPressed: () {
                    controller.signUp();
                  },
                  textColor: Colors.white,
                  color: Colors.orange,
                  child: const Text("Sign Up"),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    " have an account ?",
                  ),
                  InkWell(
                    onTap: (){
                      controller.goToSigIn();
                    },
                    child:const Text(
                      " Sign In",
                      style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )),),),
      ),
    );
  }
}
