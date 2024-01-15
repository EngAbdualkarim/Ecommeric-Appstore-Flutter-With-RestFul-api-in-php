import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/onboarding_controller.dart';
import '../../../core/constant/colors.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 40,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
        onPressed: () {
          controller.next();
        },
        color: AppColor.primaryColor,
        child: const Text(
          'Continue',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
