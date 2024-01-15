
import 'package:ecommericappstore/core/classes/crud.dart';
import 'package:ecommericappstore/linkapi.dart';

class VerifyCodeForgetPasswordData{
  Crud crud;
  VerifyCodeForgetPasswordData(this.crud);

  postData(String email,String verifycode)async{
    var response=await crud.postData(AppLink.verifycodeForgetPassword, {
      "email":email,
      "verifycode":verifycode
    });
    return response.fold((l) => l, (r) => r);
  }
}