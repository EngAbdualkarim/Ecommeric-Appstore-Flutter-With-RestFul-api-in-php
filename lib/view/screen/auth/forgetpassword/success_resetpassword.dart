import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/successresetpasswordcontroller.dart';
import '../../../../core/constant/colors.dart';

class SuccessResetPassword extends StatefulWidget {
  const SuccessResetPassword({Key? key}) : super(key: key);

  @override
  State<SuccessResetPassword> createState() => _SuccessResetPasswordState();
}

class _SuccessResetPasswordState extends State<SuccessResetPassword> {
  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller=Get.put(SuccessResetPasswordControllerImp());
  return Scaffold(
      appBar: AppBar(
        title: Text(
          "Success",
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Center(
              child: Icon(Icons.check_circle_outline,
                size: 200,color: AppColor.primaryColor,),
            ),
            Text("Success To Reset Password To SigIn Submit This Button",),
            Spacer(),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.symmetric(vertical: 13),
                onPressed: () {
                  controller.goToLogin();
                },
                textColor: Colors.white,
                color: Colors.orange,
                child: const Text("Go To Login"),
              ),
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}
