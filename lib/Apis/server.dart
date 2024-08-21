import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import '../Config/enums.dart';
import '../Config/helpers.dart';
import '../Config/my_pref.dart';

class Server {
  Server._();
  static Future<Response> get(
    String url, {
    Map<String, String>? headers,
    dynamic data,
  }) async {
    return _call(
      url,
      apiType: ApiType.get,
      headers: headers,
      data: data,
    );
  }

  static Future<Response> post(
    String url, {
    Map<String, String>? headers,
    dynamic data,
  }) async {
    return _call(
      url,
      apiType: ApiType.post,
      data: data,
      headers: headers,
    );
  }

  static Future<Response> put(
    String url, {
    Map<String, String>? headers,
    dynamic data,
  }) async {
    return _call(
      url,
      apiType: ApiType.put,
      data: data,
      headers: headers,
    );
  }

  static Future<Response> delete(
    String url, {
    Map<String, String>? headers,
    dynamic data,
  }) async {
    return _call(
      url,
      apiType: ApiType.delete,
      data: data,
      headers: headers,
    );
  }

  static Future<Response> _call(
    String url, {
    required ApiType apiType,
    Object? data,
    Map<String, String>? headers,
  }) async {
    if (await isInternetAvailable()) {
      try {
        final dio = getDioObject(headers: headers);
        final Response response;

        switch (apiType) {
          case ApiType.get:
            response = await dio.get(
              url,
            );
            break;
          case ApiType.post:
            // log(name: 'PayLoad', data.toString());
            response = await dio.post(
              url,
              data: data,
            );
            break;
          case ApiType.put:
            response = await dio.put(
              url,
              data: data,
            );
            break;
          case ApiType.delete:
            response = await dio.delete(
              url,
              data: data,
            );
            break;
        }

        return response;
      } catch (e) {
        if (e is DioException &&
            e.requestOptions.headers['Authorization'] != null) {
          if (e.response?.statusCode == 401 || e.response?.statusCode == 403) {
          } else if (e.response?.statusCode == 405) {
            if (MyPref.token == null) {
              // you can logout user here
              throw "sessionExpiredLoginAgain".tr;
            }
          }
        } else if (e is DioException &&
            e.requestOptions.headers['Authorization'] == null) {
          if (e.response?.statusCode == 403 && e.requestOptions.data is Map) {}
        }
        rethrow;
      }
    } else {
      throw "checkyourinternet".tr;
    }
  }

  static Dio getDioObject({Map<String, String>? headers}) {
    final dio = Dio();
    dio.options.baseUrl = '${getAppBaseUrl()}';
    print("baseurl"+ dio.options.baseUrl.toString());
    if (headers != null) {
      for (final String key in headers.keys) {
        dio.options.headers[key] = headers[key];
      }
    }
    dio.options.headers['Accept'] = 'application/json';
    final String? token = MyPref.token;
    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
    return dio;
  }
}
