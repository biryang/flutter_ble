import 'package:ble_app/app/controller/ble_controller.dart';
import 'package:get/get.dart';

class BleBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<BleController>(BleController());
  }
}
