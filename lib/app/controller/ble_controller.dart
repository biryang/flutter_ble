// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';

import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

class BleController extends GetxController {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  List<ScanResult>? scanList = [];
  String controllerName = 'bleCon';
  bool isScanning = false;

  BleController() {
    initBle();
  }

  void initBle() {
    // BLE 스캔 상태 얻기 위한 리스너
    flutterBlue.isScanning.listen((_isScanning) {
      isScanning = _isScanning;
      update();
    });
  }

  scan() async {
    if (!isScanning) {
      print("start scanning");
      // 기존에 스캔된 리스트 삭제
      scanList?.clear();
      // 스캔 4초간 진행
      flutterBlue.startScan(timeout: const Duration(seconds: 4));

      // 스캔 결과
      flutterBlue.scanResults.listen((results) {
        scanList = results;
        for (ScanResult r in results) {
          print('${r.device.name} found! rssi: ${r.rssi}');
        }
        update();
        initBle();
      });
    } else {
      print("stop scanning");
      // 스캔 정지
      flutterBlue.stopScan();
    }
  }

  connect(ScanResult r) async {
    await r.device.connect();
  }

  disconnect(ScanResult r) async {
    await r.device.disconnect();
  }
}
