import 'package:ecommericappstore/core/constant/routesname.dart';
import 'package:ecommericappstore/core/services/services.dart';
import 'package:ecommericappstore/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next();

  onPageChanged(int pageInndex);
}

class OnBoardingControllerImp extends OnBoardingController {
  int currentPage = 0;
  late PageController pageController;

  MyServices myServices=Get.find();
  @override
  onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  next() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      myServices.sharedPreferences.setString("step", "1");
     Get.offAllNamed(AppRoute.login);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(microseconds: 900), curve: Curves.easeInOut);
    } //end else
  }

  @override
  onPageChanged(int pageIndex) {
    currentPage = pageIndex;
    update();
  }
}
