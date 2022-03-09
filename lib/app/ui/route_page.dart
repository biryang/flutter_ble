import 'package:ble_app/app/controller/home_controller.dart';
import 'package:ble_app/app/ui/brewing_page.dart';
import 'package:ble_app/app/ui/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/pages.dart';

class RoutePage extends StatelessWidget {
  const RoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return const SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            body: TabBarView(children: [
              HomePage(),
              BrewingPage(),
              Text('dashboard'),
              Text('setting'),
            ]),
            bottomNavigationBar: TabBar(
              labelColor: Colors.black,
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                ),
                Tab(
                  icon: Icon(Icons.coffee_maker_outlined),
                ),
                Tab(
                  icon: Icon(Icons.dashboard_outlined),
                ),
                Tab(
                  icon: Icon(Icons.settings_outlined),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
