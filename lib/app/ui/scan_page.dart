import 'package:ble_app/app/controller/ble_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScanPage extends GetView<BleController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BleController>(builder: (_) {
      return SafeArea(
        child: Scaffold(
          body: Container(
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    _.scan();
                    print(_.isScanning);
                  },
                  child: Icon(_.isScanning ? Icons.stop : Icons.search),
                ),
                Text('${_.isScanning}'),
                Expanded(
                  child: ListView.builder(
                      itemCount: _.scanList!.length,
                      itemBuilder: (c, idx) {
                        String name = _.scanList![idx].device.name;
                        String mac = _.scanList![idx].device.id.id;
                        return Card(
                          child: ListTile(
                            leading: const Icon(Icons.bluetooth),
                            title: Text(name),
                            subtitle: Text(mac),
                            trailing: ElevatedButton(
                              child: _.isConnected
                                  ? Text('Disconnect')
                                  : Text('Connect'),
                              onPressed: () => _.isConnected
                                  ? _.disconnect(_.scanList![idx])
                                  : _.connect(_.scanList![idx]),
                            ),
                            onTap: () => _.selDevice(_.scanList![idx]),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
