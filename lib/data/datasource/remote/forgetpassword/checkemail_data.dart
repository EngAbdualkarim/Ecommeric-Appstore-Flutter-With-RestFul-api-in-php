
import 'package:ecommericappstore/core/classes/crud.dart';
import 'package:ecommericappstore/linkapi.dart';

class CheckEmailForgetPasswordData{
  Crud crud;
  CheckEmailForgetPasswordData(this.crud);

  postData(String email)async{
    var response=await crud.postData(AppLink.checkemailForgetPassword, {
      "email":email
    });
    return response.fold((l) => l, (r) => r);
  }
}