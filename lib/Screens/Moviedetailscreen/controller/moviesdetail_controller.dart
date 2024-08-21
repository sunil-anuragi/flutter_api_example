import 'package:dio/dio.dart';
import 'package:flutter_practical/Screens/Moviedetailscreen/model/movie_details_model.dart';

import '../../../Config/export.dart';

class MoviesdetailsController extends GetxController {
  var isLoading = false.obs;
  var email = ''.obs;
  var password = ''.obs;
  var moviesdetail = <Results>{}.obs;
  var data = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    moviedetails();
  }

  moviedetails() async {
    isLoading(true);
    try {
      var response = await Server.get(
        ApiConstants.getmoviesdetail(id: data['id']),
        headers: {
          "x-rapidapi-host": "moviesdatabase.p.rapidapi.com",
          "x-rapidapi-key": "a1e0eb3a82mshcf06b1107590888p1d5732jsnaf18acf7ea25"
        },
      );
      if (response.statusCode == 200) {
        Moviedetailsmodel data = Moviedetailsmodel.fromJson(response.data);
        moviesdetail.add(data.results!);
        print(moviesdetail.toString());
      } else {
        Get.snackbar('Error', 'movie fetch failed',
            snackPosition: SnackPosition.BOTTOM);
      }
    } on DioException catch (e) {
      handleDioError(e);
    } catch (e) {
      print(e.toString());
      Get.snackbar('Error', 'movie fetch failed',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }
}
