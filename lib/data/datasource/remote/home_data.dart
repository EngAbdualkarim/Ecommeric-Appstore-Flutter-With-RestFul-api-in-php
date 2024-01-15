
import 'package:ecommericappstore/core/classes/crud.dart';
import 'package:ecommericappstore/linkapi.dart';

class HomeData{
  Crud crud;
  HomeData(this.crud);

  getData()async{
    var response=await crud.postData(AppLink.homePage, {});
    return response.fold((l) => l, (r) => r);
  }
}