part of 'routes.dart';

abstract class Routes {
  Routes._();
  static const home = _Paths.home;

  static const moviedetailScreen = _Paths.moviedetailScreen;
  static const moviesScreen = _Paths.moviesScreen;
  static const myHomePage = _Paths.myHomePage;
}

abstract class _Paths {
  static const home = '/homeSceen';

  static const moviedetailScreen = '/MovieDetailScreen';
  static const moviesScreen = '/MoviesScreen';
  static const myHomePage = '/MyHomePage';
}
