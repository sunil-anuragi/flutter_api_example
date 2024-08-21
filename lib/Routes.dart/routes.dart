import '../Config/export.dart';
// import '../Screens/login/binding/login_binding.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.loginScreen;

  static final routes = [
    GetPage(
      
      name: Routes.loginScreen,
      page: () =>  LoginScreen(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () =>  HomeScreen(),
      // binding: HomeBinding(),
    ),
  ];
}
