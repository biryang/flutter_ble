import 'package:ble_app/app/bindings/ble_binding.dart';
import 'package:ble_app/app/ui/home_page.dart';
import 'package:get/get.dart';
part './routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => HomePage(),
      binding: BleBinding(),
    ),
  ];
}
