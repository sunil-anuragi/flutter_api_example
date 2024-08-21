import 'Config/export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690), // Adjust to your design
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          translations: MyTranslations(), // Your translations class
          locale: const Locale('en', 'US'), // Default locale
          fallbackLocale: const Locale('en', 'US'),
        );
      },
    );
  }
}
