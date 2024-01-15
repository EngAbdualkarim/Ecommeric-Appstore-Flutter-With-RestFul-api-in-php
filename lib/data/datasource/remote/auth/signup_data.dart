
import 'package:ecommericappstore/core/classes/crud.dart';
import 'package:ecommericappstore/linkapi.dart';

class SigupData{
  Crud crud;
  SigupData(this.crud);

  postData(String username,String password,String email,String phone)async{
    var response=await crud.postData(AppLink.signup, {
      "username":username,
      "password":password,
      "email":email,
      "phone":phone
    });
    return response.fold((l) => l, (r) => r);
  }
}