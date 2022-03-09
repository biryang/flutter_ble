import 'package:ble_app/app/bindings/ble_binding.dart';
import 'package:ble_app/app/bindings/home_binding.dart';
import 'package:ble_app/app/ui/brewing_page.dart';
import 'package:ble_app/app/ui/home_page.dart';
import 'package:ble_app/app/ui/route_page.dart';
import 'package:ble_app/app/ui/ble_page.dart';
import 'package:get/get.dart';
part './routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => RoutePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.BLE,
      page: () => BlePage(),
      binding: BleBinding(),
    ),
    GetPage(
      name: Routes.BREWING,
      page: () => BrewingPage(),
    ),
  ];
}
