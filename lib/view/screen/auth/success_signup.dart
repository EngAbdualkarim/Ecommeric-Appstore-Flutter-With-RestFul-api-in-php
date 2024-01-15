
import 'package:ecommericappstore/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/successsignupcontroller.dart';

class SuccessSignUp extends StatefulWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  State<SuccessSignUp> createState() => _SuccessSignUpState();
}

class _SuccessSignUpState extends State<SuccessSignUp> {
  SuccessSignUpControllerImp controller=Get.put(SuccessSignUpControllerImp());
  @override
  Widget build(BuildContext context) {
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
            Text("Congratulation",style: TextStyle(
              fontWeight:FontWeight.bold,
              fontSize: 30,
              color: Colors.black
            ),),
            Text("Success Registeration!",),
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
