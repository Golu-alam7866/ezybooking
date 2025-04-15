import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'get_server_key.dart';

class SendNotificationController extends GetxController{
  RxBool isLoading = false.obs;

  String token = "dNReAlSES9uasCw33Km8Jo:APA91bFelvJkh_iahRgqv8L7dIafkfDKxB8m9YXEXlB_0oKZGM5YCMuVD9wVFkXmcbe0EuolkMTRLBpOlkRBoKpehb_VxgyrGZ3QLutwMDPzPtliKChXL9w";
  String title = "Hi";
  String body = "This is new seller waiting for approval";
  // This is static data

  Map<String,dynamic> data = {
    "userId" : "1234567890",
    "userName" : "Ali",
    "screen" : "AliMessageScreen"
  };

  Future<void> sendNotificationUsingApi() async {
    isLoading.value = true;

    String serverKey = await GetServerKey().getServerKey();
    print("Notification server key :=> $serverKey");

    String url = "https://fcm.googleapis.com/v1/projects/foodys-7b4be/messages:send";

    var header = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $serverKey',
    };

    Map<String, dynamic> message = {
      // This is static data

      "message": {
        "token": token,
        "notification": {
          "title": title,
          "body": body,
        },
        "data": data,
      }
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: header,
        body: jsonEncode(message),
      );

      if (response.statusCode == 200) {
        print("Notification sent successfully");
        print(response.body);
        Get.snackbar("API Hit Successfully", response.body);
      } else {
        print("Failed to send notification");
        print("Status Code :=> ${response.statusCode}");
        print("Error Response: ${response.body}");
      }
    } catch (e) {
      print("Exception occurred: $e");
    } finally {
      isLoading.value = false;
    }
  }

}