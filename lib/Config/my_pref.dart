import 'export.dart';

class MyPref {
  static final _storage = GetStorage();
  static String? _token;
  static String? get token => _token;
  MyPref._();

  static void saveSelectedServer(Servers server) {
    _storage.write(
      MyPreferencesConstants.currentSelectedServer,
      server.name,
    );
  }

  static String? getCurrentServer() {
    return _storage
        .read(MyPreferencesConstants.currentSelectedServer)
        ?.toString();
  }

  static void updateCurrentUser({
    required token,
  }) {
    _token = token;
  }
}
