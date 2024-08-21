import '../Config/export.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello',
          'checkyourinternet': 'please check your internet',
          'sessionExpiredLoginAgain': 'Session expire please login again',
        },
        'es_ES': {
          'hello': 'Hola',
          'checkyourinternet': 'please check your internet',
          'sessionExpiredLoginAgain': 'Session expire please login again',
        },
      };
}
