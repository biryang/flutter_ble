import 'package:ble_app/app/bindings/ble_binding.dart';
import 'package:ble_app/app/ui/scan_page.dart';
import 'package:get/get.dart';
part './routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => ScanPage(),
      binding: BleBinding(),
    ),
  ];
}
