import 'dart:io';

import 'package:dio/dio.dart';

class LoginController {
  Future<void> loginUser() async {
    stdout.write("Enter phone: ");
    String phone = stdin.readLineSync()!;
    stdout.write("Enter password: ");
    String password = stdin.readLineSync()!;
    try {
      var postData = await Dio().post(
        "https://thimar.amr.aait-d.com/api/login",
        data: {
          "phone": phone,
          "password": password,
          "type": "android",
          "device_token": "test",
          "user_type": "client",
        },
      );
      print("Login successful, Enjoy your time.");
      print("This is your data =>");
      print(postData.data);
    } on DioException catch (_) {
      print("Invalid account!");
    }
  }
}
