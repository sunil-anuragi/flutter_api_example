import 'package:dio/dio.dart';

import '../../../Config/export.dart';

class loginController extends GetxController {
  var isLoading = false.obs;
  var email = ''.obs;
  var password = ''.obs;

  void onInit(){
    // if( GetStorage().read('token') != null){
      // Get.toNamed(Routes.home);
    // }
    super.onInit();
  }  
  login() async {
    isLoading(true);
      try {
      var response = await Server.post(
        ApiConstants.loginApiUrl,
        data: {
          "username": email.value,
          "password": password.value,
          "expiresInMins": 30
        },
      );
      if (response.statusCode == 200) {
        Get.toNamed(Routes.home);
        GetStorage().write("token", response.data['token']);
      } else {
        Get.snackbar('Error', 'Login failed',
            snackPosition: SnackPosition.BOTTOM);
      }
    } on DioException catch (e) {
      handleDioError(e);
    } catch (e) {
      print(e.toString());
      Get.snackbar('Error', 'Login failed',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }
}
