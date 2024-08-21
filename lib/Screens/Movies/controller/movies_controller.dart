import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_practical/Screens/Movies/model/movie_model.dart';

import '../../../Config/export.dart';

class MovieController extends GetxController {
  var movies = <Results>[].obs;
  var moviesslider = <Results>[].obs;
  var isLoading = true.obs;
  var isLoadingslider = true.obs;
  int _currentPage = 1;
  bool isLastPage = false;
  bool isLoadingMore = false;
  RxList<Results> filteredMovies = <Results>[].obs;
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  void onInit() {
    super.onInit();
    fetchMovies();
    fetchsliders();
    filteredMovies.value = movies;
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        fetchMovies(loadMore: true); // Load more data
      }
    });
    searchController.addListener(() {
      filterMovies();
    });
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        if (notification != null) {
          Get.toNamed(
            Routes.myHomePage,
          );
          Future.delayed(const Duration(milliseconds: 100), () {
            Get.toNamed(Routes.moviedetailScreen,
                arguments: {"id": message.data['id']});
          });
          
        }
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void filterMovies() {
    String query = searchController.text.toLowerCase();
    if (query.isNotEmpty) {
      filteredMovies.value = movies
          .where((movie) =>
              movie.originalTitleText!.text!.toLowerCase().contains(query))
          .toList();
    } else {
      filteredMovies.value = movies;
    }
  }

  Future<void> fetchMovies({bool loadMore = false}) async {
    if (isLastPage || isLoadingMore) return;

    try {
      if (loadMore) {
        isLoadingMore = true;
      } else {
        isLoading(true);
      }

      var response = await Server.get(
        ApiConstants.getmovies(limit: 5, page: _currentPage),
        headers: {
          "x-rapidapi-host": "moviesdatabase.p.rapidapi.com",
          "x-rapidapi-key": "a1e0eb3a82mshcf06b1107590888p1d5732jsnaf18acf7ea25"
        },
      );

      if (response.statusCode == 200) {
        Moviemodel data = Moviemodel.fromJson(response.data);

        if (data.results != null && data.results!.isNotEmpty) {
          movies.addAll(data.results!);
          print("Movie length: ${movies.length}");
          _currentPage++;
        } else {
          isLastPage = true;
        }
      } else {
        Get.snackbar('Error', 'Failed to fetch movies',
            snackPosition: SnackPosition.BOTTOM);
      }
    } on DioException catch (e) {
      handleDioError(e);
      if (loadMore) {
        isLoadingMore = false;
      } else {
        isLoading(false);
      }
    } catch (e) {
      print(e.toString());
      Get.snackbar('Error', 'Failed to fetch movies',
          snackPosition: SnackPosition.BOTTOM);
      if (loadMore) {
        isLoadingMore = false;
      } else {
        isLoading(false);
      }
    } finally {
      if (loadMore) {
        isLoadingMore = false;
      } else {
        isLoading(false);
      }
    }
  }

  Future<void> fetchsliders() async {
    try {
      isLoadingslider(true);

      var response = await Server.get(
        ApiConstants.getmovies(limit: 5, page: _currentPage),
        headers: {
          "x-rapidapi-host": "moviesdatabase.p.rapidapi.com",
          "x-rapidapi-key": "a1e0eb3a82mshcf06b1107590888p1d5732jsnaf18acf7ea25"
        },
      );

      if (response.statusCode == 200) {
        Moviemodel data = Moviemodel.fromJson(response.data);
        moviesslider.addAll(data.results!);
      } else {
        Get.snackbar('Error', 'Failed to fetch movies',
            snackPosition: SnackPosition.BOTTOM);
      }
    } on DioException catch (e) {
      handleDioError(e);
    } catch (e) {
      print(e.toString());
      Get.snackbar('Error', 'Failed to fetch movies',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoadingslider(false);
    }
  }
}
