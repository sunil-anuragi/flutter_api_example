part of 'routes.dart';

abstract class Routes {
  Routes._();
  static const home = _Paths.home;
  static const loginScreen = _Paths.loginScreen;
}

abstract class _Paths {
  static const home = '/homeSceen';
  static const loginScreen = '/LoginScreen';
}
