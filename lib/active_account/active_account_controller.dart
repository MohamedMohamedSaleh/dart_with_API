import 'dart:io';

import 'package:dio/dio.dart';

class ActiveAccountController {
  Future<void> activeAccount({required String phone}) async {
    print("To activate the account => ");
    stdout.write("Enter validation code: ");
    String code = stdin.readLineSync()!;
    try {
      await Dio().post(
        "https://thimar.amr.aait-d.com/api/verify",
        data: {
          "code": code,
          "phone": phone,
          "type": "ios",
          "device_token": "hmood",
        },
      );
      print("The account has been activated successfully.");
    } on DioException catch (_) {
      print("Failed to activate the account.");
    }
  }
}
