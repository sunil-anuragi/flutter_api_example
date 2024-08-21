import 'package:dio/dio.dart';

import '../../../Config/export.dart';

class HomeController extends GetxController {
  var products = <Products>[].obs;
  var categories = <Products>[].obs;
  var isLoading = true.obs;
   var selectedCategoryId = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var response = await Server.get(ApiConstants.getallproductapiUrl);
      if (response.statusCode == 200) {
        Productmodel data = Productmodel.fromJson(response.data);
        products.addAll(data.products!);
        print("product length" + products.length.toString());
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
  void fetchallcategoryies() async {
    try {
      isLoading(true);
      var response = await Server.get(ApiConstants.getallcategoriesapiUrl);
      if (response.statusCode == 200) {
        Productmodel data = Productmodel.fromJson(response.data);
        products.addAll(data.products!);
        print("product length" + products.length.toString());
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
   void selectCategory(int id) {
    selectedCategoryId(id);
  }
}
