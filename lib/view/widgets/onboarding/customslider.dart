import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/onboarding_controller.dart';
import '../../../core/constant/colors.dart';
import '../../../data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (index){
        controller.onPageChanged(index);
      },
        itemCount: onBoardingList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Image.asset(
                onBoardingList[index].image!,
                height: Get.width/1.5,
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                onBoardingList[index].title!,
                style:const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,color: AppColor.black
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    onBoardingList[index].body!,
                    textAlign: TextAlign.center,
                    style:const TextStyle(
                        height: 2,
                        color: AppColor.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ))
            ],
          );
        });
  }
}
