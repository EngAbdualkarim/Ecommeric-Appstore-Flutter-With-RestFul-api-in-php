import 'dart:io';

import 'package:ecommericappstore/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/apptheme.dart';

class LocalController extends GetxController{
  Locale? language;
MyServices myServices=Get.find();
ThemeData appTheme=themeEnglish;

changelang(String codeLanguage)async{
  Locale locale=Locale(codeLanguage);
  await myServices.sharedPreferences.setString("lange", codeLanguage);
  appTheme=codeLanguage=="ar"?themeArabic:themeEnglish;
  Get.changeTheme(appTheme);
  Get.updateLocale(locale);

}


@override
void onInit(){

  String? sharedPrefLang=myServices.sharedPreferences.getString("lange");
  if(sharedPrefLang=="ar"){
    language= const Locale("ar");
    appTheme=themeArabic;
  }else if(sharedPrefLang=="en"){
    appTheme=themeEnglish;
    language=const  Locale("en");
  }else{
    //this happen first theme to open app
    appTheme=themeEnglish;
    language=Locale(Get.deviceLocale!.languageCode);

  }
  super.onInit();
}

}