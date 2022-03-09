import 'package:ble_app/app/controller/home_controller.dart';
import 'package:ble_app/app/ui/brewing_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/pages.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Column(
        children: [
          TextButton(
            onPressed: () => Get.toNamed(Routes.BLE),
            child: Icon(Icons.bluetooth),
          ),
          Text('Home'),
        ],
      );
    });
  }
}
