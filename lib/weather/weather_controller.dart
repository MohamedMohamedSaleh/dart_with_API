import 'dart:io';

import 'package:dio/dio.dart';

import 'weather_model.dart';

class WeatherController {
  void getData() async {
    while (true) {
      print("Enter end to exit");
      stdout.write("Enter the city: ");
      String city = (stdin.readLineSync() ?? "").toLowerCase();
      if (city == "end") {
        print("Thank you");
        break;
      }
      var response = await Dio().get(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=509dc5d730ff2dd6003b22f30ae93313",
      );

      AllWeatherData model = AllWeatherData.fromJson(response.data);
      print("=> The weather in $city: \n=>The name of city: ${model.name}");
      print("=> Minimum temperature: ${((model.main.tempMin) - 32) * (5 / 9)}");
      print("=> Maximum temperature: ${((model.main.tempMax) - 32) * (5 / 9)}");
      print("=> Speed of wind: ${model.wind.speed}");
    }
  }
}
