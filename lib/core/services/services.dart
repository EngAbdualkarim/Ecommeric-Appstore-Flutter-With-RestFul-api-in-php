import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends  GetxService{

  late SharedPreferences sharedPreferences;

  Future<MyServices> init()async {
    await Firebase.initializeApp();
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

}

//function out to class

initalServices()async{
  await Get.putAsync(() => MyServices().init());
}//end fun