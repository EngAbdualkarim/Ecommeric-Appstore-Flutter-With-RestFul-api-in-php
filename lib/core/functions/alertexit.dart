

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp(){
  Get.defaultDialog(
    title: "تنبية",
    middleText: "هل تريد الخروج من التطبق",
    actions: [
      ElevatedButton(onPressed: (){
        exit(0);
      }, child: Text("Confirm")),
      ElevatedButton(onPressed: (){
        Get.back();
      }, child: Text("Cancel")),
    ]
  );
  return Future.value(true);
}