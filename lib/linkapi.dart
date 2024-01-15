

class AppLink{
  static const String server="http://192.168.51.133:8080/Ecommericappwithflutterandphp";
  static const String test="$server/test.php";

  //======================Images Links==================
  static const String imageStatic="$server/upload";
  static const String imageCategories="$imageStatic/categories";
  static const String imageItems="$imageStatic/items";
  //======================Auth Links==================
  static const String signup="$server/auth/signup.php";
  static const String login="$server/auth/login.php";
  static const String verifyCodeSignup="$server/auth/verifycode.php";
  //======================ForgetPassword Links==================
  static const String checkemailForgetPassword="$server/forgetpassword/checkemail.php";
  static const String resetpasswordForgetPassword="$server/forgetpassword/resetpassword.php";
  static const String verifycodeForgetPassword="$server/forgetpassword/verifycode.php";
 //======================HomePage Link==================
  static const String homePage="$server/home.php";


}
