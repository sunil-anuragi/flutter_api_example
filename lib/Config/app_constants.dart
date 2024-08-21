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
}

class ApiConstants {
  ApiConstants._();
  //Base BacKEND_URLs
  static const String prodBaseUrl = 'https://dummyjson.com/';
  static const String prodSummarizerBaseUrl = 'https://dummyjson.com/';
  static const String stagingBaseUrl = 'https://dummyjson.com/';
  static const String devBaseUrl = 'https://dummyjson.com/';

  static const String loginApiUrl = 'auth/login';
  static const String getallproductapiUrl = 'products';
  static const String getallcategoriesapiUrl = 'category-list';

  static String getBasePromptsSubCategories({
    required String categoryId,
    required String query,
    required int page,
  }) =>
      'prompt/getAllSubCategory/$categoryId?searchQuery=$query&page=$page&per_page=10';

  static String getAllBasePrompts({
    required String subCategoryId,
    required String query,
    required int page,
  }) =>
      'prompt/getAllPrompts/$subCategoryId?searchQuery=$query&page=$page&per_page=10';

  // static String getChatsList(
  //   String chatId,
  //   int page,
  //   String? searchQuery,
  //   ChatListTime? filter,
  // ) =>
  //     'chat-list/showByPagination?page=$page&perPage=10&chatListId=$chatId&search=$searchQuery&filter=${filter?.name ?? ''}';

  static String getNotifications({
    int? page = 1,
  }) =>
      'notification/index?page=$page';

  static String getReferralStats(String userID) =>
      'auth/user/referral-details/$userID';

  static String getUserDetails(String userID) =>
      'auth/user/user-detail/$userID';
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
