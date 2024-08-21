import 'package:flutter_practical/Config/export.dart';

class AppConstants {
  AppConstants._();

//Global setting

  static const heroAnimationTag = 'appIcon';
  static const String ios = "ios";
  static const String android = "android";
  static const String opera = "opera";
  static const String chrome = "chrome";
  static const String firefox = "firefox";
  static const String safari = "safari";
  static const String logo =
      '''<svg width="189" height="25" viewBox="0 0 189 25" fill="none" xmlns="http://www.w3.org/2000/svg">
<g clip-path="url(#clip0_1_12)">
<path d="M132.294 24.8944H176.357C177.957 24.8944 179.542 24.5727 181.02 23.9477C182.498 23.3227 183.841 22.4067 184.973 21.2518C186.104 20.097 187.002 18.726 187.614 17.2171C188.227 15.7082 188.542 14.091 188.542 12.4578C188.544 10.8228 188.231 9.20331 187.62 7.69198C187.009 6.18066 186.112 4.80716 184.98 3.65007C183.848 2.49299 182.504 1.57502 181.025 0.9487C179.545 0.32238 177.959 -2.35641e-06 176.357 0L132.294 0C130.692 -2.35641e-06 129.106 0.32238 127.626 0.9487C126.146 1.57502 124.802 2.49299 123.67 3.65007C122.539 4.80716 121.642 6.18066 121.031 7.69198C120.419 9.20331 120.106 10.8228 120.109 12.4578C120.109 15.7562 121.393 18.9195 123.678 21.2518C125.963 23.5841 129.062 24.8944 132.294 24.8944ZM6.96464 24.9296H12.3433V4.8705H19.3079V0H0V4.85642H6.96464V24.9296ZM26.3415 24.9296H31.7201V5.80659H31.7891L37.9607 24.9155H42.0981L48.4766 5.80659H48.5456V24.9155H53.9242V0H45.8218L40.1673 16.2584H40.0984L34.4784 0H26.3415V24.9296ZM61.4681 0.0844595H69.536C71.4144 0.087406 73.2854 0.323754 75.1077 0.788288C76.7673 1.19014 78.3312 1.92724 79.7072 2.95608C81.0379 3.97739 82.1092 5.30974 82.8309 6.84122C83.6468 8.66072 84.0408 10.6477 83.9825 12.6478C84.0198 14.4904 83.6374 16.3168 82.8654 17.9828C82.1465 19.4821 81.1158 20.8032 79.8451 21.8539C78.5444 22.9183 77.0589 23.723 75.4663 24.2258C73.7829 24.7714 72.0263 25.0445 70.2601 25.0352H61.4681V0.0844595ZM66.8467 19.9324H69.605C70.7651 19.9405 71.9222 19.8106 73.0528 19.5453C74.0617 19.3363 75.0158 18.9118 75.8525 18.2995C76.651 17.6827 77.2862 16.8723 77.7005 15.9417C78.1847 14.816 78.4201 13.5953 78.3901 12.3663C78.4106 11.265 78.1742 10.1746 77.7005 9.18497C77.2704 8.30796 76.6502 7.54252 75.887 6.94679C75.0937 6.34548 74.1983 5.89924 73.2459 5.63063C72.1955 5.33085 71.1094 5.18161 70.0187 5.18722H66.8467V19.9324ZM91.7746 0.0844595H100.877C101.945 0.0849911 103.012 0.162606 104.07 0.316723C105.073 0.449367 106.046 0.758967 106.945 1.2317C107.785 1.67662 108.498 2.33621 109.014 3.14611C109.586 4.13443 109.862 5.27231 109.807 6.41892C109.854 7.69573 109.445 8.94652 108.655 9.93806C107.849 10.8907 106.787 11.5809 105.6 11.9229V11.9651C106.364 12.0764 107.105 12.3141 107.793 12.6689C108.429 12.9948 109.002 13.436 109.483 13.971C109.959 14.5067 110.327 15.1335 110.565 15.815C110.822 16.5367 110.951 17.2995 110.945 18.0673C110.986 19.2238 110.699 20.3677 110.117 21.3612C109.576 22.226 108.844 22.9492 107.979 23.4727C107.071 24.0296 106.075 24.4224 105.035 24.634C103.963 24.8686 102.87 24.9866 101.773 24.9859H91.7746V0.0844595ZM97.1532 10.0436H101.049C101.462 10.0459 101.874 9.99869 102.277 9.90287C102.661 9.81759 103.028 9.66265 103.359 9.44538C103.682 9.23268 103.95 8.94278 104.139 8.60079C104.341 8.21107 104.44 7.77463 104.428 7.3339C104.45 6.88596 104.345 6.44106 104.125 6.05293C103.911 5.72034 103.619 5.44709 103.277 5.2576C102.892 5.06068 102.481 4.92537 102.056 4.85642C101.636 4.77345 101.209 4.73103 100.78 4.72973H97.1256L97.1532 10.0436ZM97.1532 20.3547H101.98C102.405 20.3559 102.828 20.3087 103.242 20.214C103.654 20.128 104.045 19.9606 104.394 19.7213C104.742 19.4869 105.032 19.1738 105.242 18.8063C105.468 18.3867 105.58 17.9127 105.566 17.4338C105.584 16.9287 105.434 16.4322 105.138 16.0262C104.849 15.6609 104.474 15.3754 104.049 15.1957C103.607 15.0078 103.144 14.8777 102.67 14.8086C102.201 14.7407 101.729 14.7054 101.256 14.703H97.1877L97.1532 20.3547Z" fill="url(#paint0_linear_1_12)"/>
</g>
<defs>
<linearGradient id="paint0_linear_1_12" x1="0" y1="12.5" x2="188.542" y2="12.5" gradientUnits="userSpaceOnUse">
<stop stop-color="#90CEA1"/>
<stop offset="0.56" stop-color="#3CBEC9"/>
<stop offset="1" stop-color="#00B3E5"/>
</linearGradient>
<clipPath id="clip0_1_12">
<rect width="188.542" height="25" fill="white"/>
</clipPath>
</defs>
</svg>
''';
  static const String moreicon =
      '''<svg width="33" height="33" viewBox="0 0 33 33" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M2.75 11C2.75 10.2707 3.03973 9.57118 3.55546 9.05546C4.07118 8.53973 4.77065 8.25 5.5 8.25H27.5C28.2293 8.25 28.9288 8.53973 29.4445 9.05546C29.9603 9.57118 30.25 10.2707 30.25 11C30.25 11.7293 29.9603 12.4288 29.4445 12.9445C28.9288 13.4603 28.2293 13.75 27.5 13.75H5.5C4.77065 13.75 4.07118 13.4603 3.55546 12.9445C3.03973 12.4288 2.75 11.7293 2.75 11ZM2.75 22C2.75 21.2707 3.03973 20.5712 3.55546 20.0555C4.07118 19.5397 4.77065 19.25 5.5 19.25H27.5C28.2293 19.25 28.9288 19.5397 29.4445 20.0555C29.9603 20.5712 30.25 21.2707 30.25 22C30.25 22.7293 29.9603 23.4288 29.4445 23.9445C28.9288 24.4603 28.2293 24.75 27.5 24.75H5.5C4.77065 24.75 4.07118 24.4603 3.55546 23.9445C3.03973 23.4288 2.75 22.7293 2.75 22Z" fill="#032540"/>
</svg>

''';
}

class ApiConstants {
  ApiConstants._();
  //Base BacKEND_URLs
  static const String prodBaseUrl = 'https://moviesdatabase.p.rapidapi.com';
  static const String prodSummarizerBaseUrl =
      'https://moviesdatabase.p.rapidapi.com';
  static const String stagingBaseUrl = 'https://moviesdatabase.p.rapidapi.com';
  static const String devBaseUrl = 'https://moviesdatabase.p.rapidapi.com';

  static const String loginApiUrl = 'auth/login';
  static const String getallmovieapiUrl = '/titles/x/upcoming';
  static const String getallmoviedetailsapiUrl = '/titles';

  static String getmovies({
    required int limit,
    required int page,
  }) =>
      '$getallmovieapiUrl?limit=$limit&page=$page';

  static String getmoviesdetail({
    required String id,
  }) =>
      '$getallmoviedetailsapiUrl/$id';
}

class MyPreferencesConstants {
  MyPreferencesConstants._();
  static const currentUser = 'currentUser';
  static const notificationsStatus = 'notificationsStatus';
  static const currentUserToken = 'currentUserToken';
  static const currentAppTheme = 'currentAppTheme';
  static const currentSelectedServer = 'currentSelectedServer';
  static const currentPartner = 'currentPartner';
}

class MycolorConstants {
  MycolorConstants._();
  static const primarycolor = Color(0xff3CBEC9);
  static const whitecolor = Colors.white;
  static const blackcolor = Colors.black;
  static const greycolor = Colors.grey;
}
class Myfont {
  Myfont._();
  static const quicksand = "quicksand";
  
}
