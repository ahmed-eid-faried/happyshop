import 'package:happyshop/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController {
  successSignUp();
  goToLogin();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  successSignUp() {}

  @override
  goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
