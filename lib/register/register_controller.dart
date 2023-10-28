import 'dart:io';

import 'package:dart_with_api/active_account/active_account_controller.dart';
import 'package:dio/dio.dart';

class RegisterController {
  Future<void> registerUser() async {
    stdout.write("Enter your fullname: ");
    String fullName = stdin.readLineSync()!;
    stdout.write("Enter your phone: ");
    String phone = stdin.readLineSync()!;
    stdout.write("Enter your password: ");
    String password = stdin.readLineSync()!;
    stdout.write("Enter your password confirmation: ");
    String passwordConfirmation = stdin.readLineSync()!;
    stdout.write("Enter your city id: ");
    int cityId = int.tryParse(stdin.readLineSync()!) ?? 0;
    try {
      await Dio().post(
        "https://thimar.amr.aait-d.com/api/client_register",
        data: {
          "phone": phone,
          "fullname": fullName,
          "password": password,
          "country_id": 1,
          "city_id": cityId,
          "password_confirmation": passwordConfirmation,
        },
      );
      print("Registerd successfully, You must activate the account first => ");
      ActiveAccountController().activeAccount(phone: phone);
    } on DioException catch (ex) {
      print(ex.response!.data["message"]);
    }
  }
}
