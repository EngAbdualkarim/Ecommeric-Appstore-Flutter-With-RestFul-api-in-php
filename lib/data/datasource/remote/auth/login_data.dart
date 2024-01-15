
import 'package:ecommericappstore/core/classes/crud.dart';
import 'package:ecommericappstore/linkapi.dart';

class LoginData{
  Crud crud;
  LoginData(this.crud);

  postData(String email,String password)async{
    var response=await crud.postData(AppLink.login, {
      "email":email,
      "password":password
    });
    return response.fold((l) => l, (r) => r);
  }
}