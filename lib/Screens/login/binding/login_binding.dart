
import 'package:flutter_practical/Screens/login/controller/login_controller.dart';
import '../../../Config/export.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<loginController>(() => loginController());
  }
}