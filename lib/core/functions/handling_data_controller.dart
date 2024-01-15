import '../classes/statusrequest.dart';

handlingData(resonse) {
  if (resonse is StatusRequest) {
    return resonse;
  } else {
    return StatusRequest.success;
  }
}
