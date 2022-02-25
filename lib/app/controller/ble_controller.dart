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
  bool isConnected = false;
  BluetoothDeviceState _deviceState = BluetoothDeviceState.disconnected;

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

  selDevice(ScanResult r) async {
    print(r);
  }

  connect(ScanResult r) async {
    /*
      타임아웃을 10초(10000ms)로 설정 및 autoconnect 해제
       참고로 autoconnect가 true되어있으면 연결이 지연되는 경우가 있음.
     */
    await r.device
        .connect(autoConnect: false)
        .timeout(Duration(milliseconds: 10000), onTimeout: () {
      //타임아웃 발생
      print('disconnected');
      connectionState(BluetoothDeviceState.disconnected);
    }).then((data) {
      print('connected');
      connectionState(BluetoothDeviceState.connected);
    });

    // await r.device.connect();
  }

  disconnect(ScanResult r) async {
    try {
      connectionState(BluetoothDeviceState.disconnected);
      await r.device.disconnect();
    } catch (e) {}
  }

  connectionState(BluetoothDeviceState event) {
    switch (event) {
      case BluetoothDeviceState.disconnected:
        isConnected = false;
        break;
      case BluetoothDeviceState.disconnecting:
        break;
      case BluetoothDeviceState.connected:
        isConnected = true;
        break;
      case BluetoothDeviceState.connecting:
        break;
    }

    _deviceState = event;
    update();
  }
}
