

import 'package:ecommericappstore/core/classes/crud.dart';
import 'package:ecommericappstore/linkapi.dart';

class VerifyCodeSigupData{
  Crud crud;
  VerifyCodeSigupData(this.crud);

  postData(String email,String verifycode)async{
    var response=await crud.postData(AppLink.verifyCodeSignup, {
      "email":email,
      "verifycode":verifycode
    });
    return response.fold((l) => l, (r) => r);
  }
}