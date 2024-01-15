import 'package:ecommericappstore/core/classes/crud.dart';
import 'package:ecommericappstore/linkapi.dart';

class TestData{
  Crud crud;
  TestData(this.crud);

  getData()async{
    var response=await crud.postData(AppLink.test, {});
    return response.fold((l) => l, (r) => r);
  }
}