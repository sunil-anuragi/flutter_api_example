import 'dart:io';

import 'package:dio/dio.dart';

import 'export.dart';

Future<bool> isInternetAvailable() async {
  try {
    final result = await InternetAddress.lookup('example.com');
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } on SocketException catch (_) {
    return false;
  }
}

Future<String?> getDeviceIPAdress() async {
  final list = await NetworkInterface.list();
  if (list.isNotEmpty && list.first.addresses.isNotEmpty) {
    return list.first.addresses.first.address;
  }
  return null;
}

getAppBaseUrl() {
  final value = Servers.values.firstWhereOrNull(
    (element) => element.name == MyPref.getCurrentServer(),
  );
  switch (value) {
    case Servers.production:
      return ApiConstants.prodBaseUrl;
    case Servers.staging:
      return ApiConstants.stagingBaseUrl;
    case Servers.dev:
      return ApiConstants.devBaseUrl;
    case null:
      return ApiConstants.prodBaseUrl;
  }
}

void handleDioError(DioException e) {
  if (e.response != null) {
    print('Dio error! Status Code: ${e.response?.statusCode}');
    print('Dio error! Data: ${e.response?.data}');
    switch (e.response?.statusCode) {
      case 400:
        // Handle Bad Request error
        _handleBadRequest(e.response?.data);
        break;
      // Handle other status codes as needed
      default:
        print('Unexpected error: ${e.response?.statusCode}');
    }
  } else {
    // Handle error without response (e.g., network error)
    print('Dio error without response: ${e.message}');
  }
}

void _handleBadRequest(dynamic data) {
  // Handle specific details of the bad request error
  if (data is Map && data['message'] != null) {
    print('Bad Request Error: ${data['message']}');
    Get.snackbar('Alert', data['message'],
          snackPosition: SnackPosition.BOTTOM);
    // Show error to the user, log it, etc.
  } else {
    print('Bad Request Error: Unknown format');
  }
}
