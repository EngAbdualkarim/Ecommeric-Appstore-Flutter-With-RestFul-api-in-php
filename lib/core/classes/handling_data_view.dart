
import 'package:ecommericappstore/core/classes/statusrequest.dart';
import 'package:ecommericappstore/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView({Key? key,required this.statusRequest,required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest==StatusRequest.loading?
    Center(child:  Lottie.asset(AppImageAsset.loading,width: 250,height: 250),):
    statusRequest==StatusRequest .offLineFailure?
    Center(child: Lottie.asset(AppImageAsset.offline,width: 250,height: 250),):
    statusRequest==StatusRequest.serverFailure?
    Center(child: Lottie.asset(AppImageAsset.server,width: 250,height: 250),):
    statusRequest==StatusRequest.failure?
    Center(child: Lottie.asset(AppImageAsset.nodata,width: 250,height: 250,repeat: true),):widget;

  }
}


class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest({Key? key,required this.statusRequest,required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest==StatusRequest.loading?
       Center(child:  Lottie.asset(AppImageAsset.loading,width: 250,height: 250),):
      statusRequest==StatusRequest .offLineFailure?
       Center(child: Lottie.asset(AppImageAsset.offline,width: 250,height: 250),):
      statusRequest==StatusRequest.serverFailure?
       Center(child: Lottie.asset(AppImageAsset.server,width: 250,height: 250),)
          : widget;

  }
}
