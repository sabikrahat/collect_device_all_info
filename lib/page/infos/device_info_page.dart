import '../../api/device_info_api.dart';
import '../../widget/info_widget.dart';
import 'package:flutter/material.dart';

class DeviceInfoPage extends StatefulWidget {
  const DeviceInfoPage({Key? key}) : super(key: key);

  @override
  _DeviceInfoPageState createState() => _DeviceInfoPageState();
}

class _DeviceInfoPageState extends State<DeviceInfoPage> {
  Map<String, dynamic> deviceInfo = {};

  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    final deviceInfo = await DeviceInfoApi.getInfo();

    if (!mounted) return;
    setState(() => this.deviceInfo = deviceInfo);
  }

  @override
  Widget build(BuildContext context) {
    return InfoWidget(map: deviceInfo);
  }
}
