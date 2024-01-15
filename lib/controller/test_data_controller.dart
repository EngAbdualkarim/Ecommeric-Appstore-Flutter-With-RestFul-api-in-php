
import 'package:ecommericappstore/core/classes/statusrequest.dart';
import 'package:ecommericappstore/data/datasource/remote/test_data.dart';
import 'package:get/get.dart';
import '../core/functions/handling_data_controller.dart';

class TestController extends GetxController{
  TestData testData=TestData(Get.find());
  List data=[];
  late StatusRequest statusRequest;

  getData()async{
    statusRequest=StatusRequest.loading;
    var response=await testData.getData();
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=='success') {
        data.addAll(response['data']);
      }
      else{
        statusRequest=StatusRequest.failure;
      }
    }
    update();
  }//end fun

  @override
  onInit() {
    getData();
    super.onInit();
  }





}