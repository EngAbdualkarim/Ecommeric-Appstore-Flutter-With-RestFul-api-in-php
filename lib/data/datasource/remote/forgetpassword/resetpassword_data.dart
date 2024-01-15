
import 'package:ecommericappstore/core/classes/crud.dart';
import 'package:ecommericappstore/linkapi.dart';

class ResetPasswordForgetPasswordData{
  Crud crud;
  ResetPasswordForgetPasswordData(this.crud);

  postData(String email,String password)async{
    var response=await crud.postData(AppLink.resetpasswordForgetPassword, {
      "email":email,
      "password":password
    });
    return response.fold((l) => l, (r) => r);
  }
}