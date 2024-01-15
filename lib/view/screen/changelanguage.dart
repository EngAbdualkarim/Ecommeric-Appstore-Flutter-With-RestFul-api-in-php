
import 'package:ecommericappstore/core/constant/routesname.dart';
import 'package:ecommericappstore/core/localization/changelocal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/colors.dart';


class Language extends GetView<LocalController> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1".tr,style: Theme.of(context).textTheme.headline1),
            const SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: MaterialButton(
                textColor: Colors.white,
                color: AppColor.primaryColor,
                child: const Text("Ar",style: TextStyle(fontWeight: FontWeight.bold,),),
                onPressed: (){
                  controller.changelang("ar");
                  Get.toNamed(AppRoute.onboarding);
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: MaterialButton(
                textColor: Colors.white,
                color: AppColor.primaryColor,
                child: const Text("EN",style: TextStyle(fontWeight: FontWeight.bold,),),
                onPressed: (){
                  controller.changelang("en");
                  Get.toNamed(AppRoute.onboarding);
                },
              ),
            )

          ],
        ),
      ),
    );
  }
}
