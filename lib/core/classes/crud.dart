import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommericappstore/core/classes/statusrequest.dart';
import 'package:ecommericappstore/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud{

  Future<Either<StatusRequest, Map>> postData(String linkUrl,Map data) async {
   try{
     if (await checkInternet()) {
       var response=await http.post(Uri.parse(linkUrl),body:data);
       print("=========${response.statusCode}==${response.body}====");
       if(response.statusCode==200||response.statusCode==201){
         Map responseBody=jsonDecode(response.body);
         print("=========$responseBody======");
         return Right(responseBody);
       }else{
         return const Left(StatusRequest.serverFailure);
       }
     } else {
       return const  Left(StatusRequest.offLineFailure);
     }
   }catch(_){
     return const Left(StatusRequest.serverException);
   }

  }//end fun


}
