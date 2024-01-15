import 'package:ecommericappstore/controller/onboarding_controller.dart';
import 'package:ecommericappstore/core/constant/colors.dart';
import 'package:ecommericappstore/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/onboarding/custombutton.dart';
import '../widgets/onboarding/customslider.dart';
import '../widgets/onboarding/dotcontroller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: CustomSliderOnBoarding(),
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  CustomDotControllerOnBoarding(),
               const Spacer(flex: 2,),
                  CustomButtonOnBoarding(),
                ],
              )),
        ],
      ),
    ));
  }
}
