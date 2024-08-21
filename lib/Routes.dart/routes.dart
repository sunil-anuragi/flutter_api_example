import '../Config/export.dart';
import '../Screens/Home/view/Home_screen.dart';
import '../Screens/Home/view/mainhome.dart';
// import '../Screens/login/binding/login_binding.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.myHomePage;

  static final routes = [
    GetPage(
        name: Routes.moviedetailScreen,
        page: () => MovieDetailScreen(),
        transition: Transition.downToUp),
    GetPage(
        name: Routes.home,
        page: () => HomeScreen(),
        transition: Transition.downToUp),
    GetPage(
        name: Routes.moviesScreen,
        page: () => MoviesScreen(),
        transition: Transition.downToUp),
    GetPage(
        name: Routes.myHomePage,
        page: () => MyHomePage(),
        transition: Transition.downToUp),
  ];
}
