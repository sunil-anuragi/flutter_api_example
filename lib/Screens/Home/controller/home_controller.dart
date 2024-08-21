import 'dart:convert';
import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../../Config/export.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:http/http.dart' as http;
import 'package:googleapis/servicecontrol/v1.dart' as servicecontrol;

class loginController extends GetxController {
  var isLoading = false.obs;
  var email = ''.obs;
  var password = ''.obs;

  void onInit() {
    // if( GetStorage().read('token') != null){
    // Get.toNamed(Routes.home);
    // }
    super.onInit();
  }

  getAccessToken() async {
    // Your client ID and client secret obtained from Google Cloud Console
    final serviceAccountJson = {
      "type": "service_account",
      "project_id": "movies-2edb9",
      "private_key_id": "879a9a1c5c5f8c7f667b707cabbc2b5ba02090b2",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDWC1Yh+kFpx1Ic\n7be++QtRZKtcJVW5L7HkvpVzeYWBffqkYdmNHaQozO47GFUPTAlaofwHEOqDJKie\ngbu7HjBhFgJM2PDi/tktxlS0MKmp5Xx8p0Toaen11ejA4d8+/KvETuYhZ3vbXqpK\ndW/oq4FL1Oy15BDCc9oaWRIeRyFEDgim7gVqDque2ZyK/guG5VPNS+97vdKm3iX3\n4tRUJ8qilFIHRB1e4hAr5HJgkvMmTDT/rnA8I1DImXPkr0sFZzwRvvhnyp5HX933\n2krucXjGFc2YRMOwT85bfdvOj/VyO6Yjt5ID7LU8ifZoIfxkctk56qsXWhMdXCFr\n0pgwQgDZAgMBAAECggEAVxxmAY4H8TTdhkh475ALuyRtWSMYsDVpAN9Pk59xZjIP\nP7dTAst9c91zVzmf5IndhLVIDNglmRniRiAmdxDiP6DlbsEbyEZPvQFql6r2Yd6z\nu0eYE76HKTXVdCp44PmULmCt6AplrfHo/ESvNtIV3PbbH2uiJoFf0jlN1mS8dSVB\n1DGn4lL5d1BWUeMk2k/F9I/rhJaQmQcuSFFZjvSIC4opgfD12lTiXy8vZ06btv6V\nPoxREe6rZdHPdJUCqtxZp6BHQVCIzXR8Y6WPssB/KRYqkV/B5kMMe+Vx83/8ZHob\nhjTo39eaBPMISwAijHjeqMzdaLOHdkqGyM07qQrOwQKBgQD+AG2kWK3eNzUN3bjZ\n5iPWhb0DqFNeB/TLD5x/08jMH72OmPSPh8x7Sc01VZfeOZ14zsblTocnQHdTpqkN\njcp/WKdWgTfWhxgDUBRoDyc0LOChD9ao0q4X6NOFhhBUnqr3P+Jy0MKY96kRjaFV\nJofJSVp8cZ+ehYKpavombSqTawKBgQDXum6aT59/wO0QkznrKgCakdRVcDCp6cdY\nm8z+CfzL1SGA0bkiilmk+AlG9mvtGKh5kcqs4j+V6JoDT1W4K5rZ3O6j4bzqK3+B\nWoJIm98O6SqK59nhEOBXtK6BCw1fq5Mj6CDXIViMGcD6X0JT4uVF+uUzM3a61Wlk\nKTIWBV8RywKBgFyHR2mxLFVhAyCz/pzSK4gAXCSy8vu0Jka6vyYJvoItpd4GdkC7\nFZBsCCc/sP0xO95AZVAvVSjFYTLF6ZuYZYYSg5MNq4uo1uSODYEC1CM7nfDOVkJV\nzTnEhRmFBvnsexdq3FE7H0ieH6bXU0gzqw92e1IOCjmzJTAWWl4ZMoNVAoGBAJef\nUwlmGSaDhJt3vueIF/CLun9qYOmrhA7FQmjywBjLbcbKoKKkNql6I5saq3RzNkZr\nr9WfFy3X1BerdQYCr82cOKY6jLrRY8aYxKUf2MD0JJCIsFw9rlA2j8fm6rlpL/u2\ntQ4/Q6sEltvihA3NlXOACgPYkgRy5qYdRjSwBcfNAoGAaEOV7K5GRFEWazKztwml\n2r4cH96CZlbj/Sc5ZHE20dsUKyIxaSNeNOlScJJZoMc4VuWLu78hzcP+istF5Lup\nxBxybBJJZst3495bvB3iAzJEzYyMxc3JdF3laN23wdVpc8Spbh12pMdUyozxOZ8h\nxele01VxCuPRO77b8+C6/yY=\n-----END PRIVATE KEY-----\n",
      "client_email":
          "firebase-adminsdk-1mbpr@movies-2edb9.iam.gserviceaccount.com",
      "client_id": "103745590910652051732",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-1mbpr%40movies-2edb9.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    };

    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging"
    ];

    http.Client client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
    );

    // Obtain the access token
    auth.AccessCredentials credentials =
        await auth.obtainAccessCredentialsViaServiceAccount(
            auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
            scopes,
            client);

    // Close the HTTP client
    client.close();

    // Return the access token
    return credentials.accessToken.data;
  }

  sendFCMMessage() async {
    final String serverKey = await getAccessToken(); // Your FCM server key
    final String fcmEndpoint =
        'https://fcm.googleapis.com/v1/projects/movies-2edb9/messages:send';
    final currentFCMToken = await FirebaseMessaging.instance.getToken();
    log("fcmkey : $currentFCMToken");
    final Map<String, dynamic> message = {
      'message': {
        'token':
            currentFCMToken, // Token of the device you want to send the message to
        'notification': {
          'body': 'This is an FCM notification message!',
          'title': 'FCM hii Message',
        },
        'data': {
          'current_user_fcm_token': currentFCMToken,
          'id':"tt10209920" // Include the current user's FCM token in data payload
        },
      }
    };

    final http.Response response = await http.post(
      Uri.parse(fcmEndpoint),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $serverKey',
      },
      body: jsonEncode(message),
    );
    log("Tpke ==> " + 'Bearer' + serverKey.toString());

    if (response.statusCode == 200) {
      print('FCM message sent successfully');
    } else {
      print('Failed to send FCM message: ${response.statusCode}');
    }
  }
}
