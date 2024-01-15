import 'package:ecommericappstore/core/constant/routesname.dart';
import 'package:ecommericappstore/core/middleware/middleware.dart';
import 'package:ecommericappstore/test.dart';
import 'package:ecommericappstore/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommericappstore/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommericappstore/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommericappstore/view/screen/auth/singup.dart';
import 'package:ecommericappstore/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:ecommericappstore/view/screen/auth/success_signup.dart';
import 'package:ecommericappstore/view/screen/auth/verifycodesignup.dart';
import 'package:ecommericappstore/view/screen/changelanguage.dart';
import 'package:ecommericappstore/view/screen/home.dart';
import 'package:ecommericappstore/view/screen/onboarding.dart';
import 'package:ecommericappstore/view/tset_view.dart';
import 'package:get/get.dart';
import 'view/screen/auth/login.dart';


List<GetPage<dynamic>>? routes=[
GetPage(name:"/" , page:()=>Language(),middlewares: [MyMiddleWare()]),
//GetPage(name:"/" , page:()=>const TestView()),
  GetPage(name:AppRoute.login , page:()=>Login()),
  GetPage(name: AppRoute.signup , page:()=>SignUp()),
  GetPage(name:AppRoute.forgetPassword , page:()=>ForgetPassword()),
  GetPage(name:AppRoute.verfiyCode , page:()=>VerifyCode()),
  GetPage(name:AppRoute.succeesResetPasword , page:()=>SuccessResetPassword()),
  GetPage(name:AppRoute.succeesSignUp , page:()=>SuccessSignUp()),
  GetPage(name: AppRoute.verfiyCodeSignUp , page:()=>VerifyCodeSignUp()),
  GetPage(name:AppRoute.login , page:()=>Login()),
  GetPage(name:AppRoute.onboarding , page:()=>OnBoarding()),
  GetPage(name:AppRoute.resetPassword , page:()=>ResetPassword()),
  GetPage(name:AppRoute.homepage , page:()=>HomePage()),
];
