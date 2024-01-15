
import 'package:get/get.dart';

validInput(val,min,max,type){
  if(val.isEmpty){
    return  "$type can't be Empty";
  }
  if(val.length<min){
    return "$val can't be less than $min";
  }if(val.length>max){
    return  "$val can't be larger than $max";
  }
if(type=="username"){
if(!GetUtils.isUsername(val)){
  return "not valid username";
}
}
if(type=="email"){
  if(!GetUtils.isEmail(val)){
    return "not valid email";
  }
}

if(type=="phone"){
  if(!GetUtils.isPhoneNumber(val)){
    return "not valid phone";
  }}



}