
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../core/classes/crud.dart';

class InitialBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(Crud());
    //Get.lazyPut(() => SignupControllerImp(),fenix: true);
  }

}