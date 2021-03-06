import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './app/routes/pages.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.INITIAL,
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
  ));
}
