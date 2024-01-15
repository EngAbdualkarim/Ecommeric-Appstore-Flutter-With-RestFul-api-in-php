import 'package:ecommericappstore/core/localization/changelocal.dart';
import 'package:ecommericappstore/core/localization/translation.dart';
import 'package:ecommericappstore/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'binding/initalbinding.dart';
import 'core/services/services.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await initalServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LocalController controller= Get.put(LocalController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      locale: controller.language,
      title: 'Flutter Demo',
      theme:controller.appTheme,
      initialBinding: InitialBinding(),
      //routes: routes,
      getPages: routes,
    );
  }
}
