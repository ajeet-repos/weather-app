import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/routes/app_pages.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Weather App",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        fontFamily: 'Roboto',
        brightness: Brightness.dark,
      ),
    );
  }
}