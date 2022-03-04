import 'package:flutter/material.dart';

import '../../api/device_info_api.dart';
import '../../api/ip_info_api.dart';
import '../../api/package_info_api.dart';
import '../../api/platform_indentify.dart';
import '../../widget/info_widget.dart';

class ApplicationInfoPage extends StatefulWidget {
  const ApplicationInfoPage({Key? key}) : super(key: key);

  @override
  _ApplicationInfoPageState createState() => _ApplicationInfoPageState();
}

class _ApplicationInfoPageState extends State<ApplicationInfoPage> {
  Map<String, dynamic> map = {};

  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    final packageName = await PackageInfoApi.getPackageName();
    final appVersion = await PackageInfoApi.getAppVersion();
    final ipAddress = await IpInfoApi.getIPAddress();
    final device = await DeviceInfoApi.getDeviceInfo();
    final deviceVersion = await DeviceInfoApi.getDeviceVersion();
    final operatingSystem = PlatformIndentify.deviceType == DeviceType.isAndroid || PlatformIndentify.deviceType == DeviceType.isIOS ? await DeviceInfoApi.getOperatingSystem() : 'Not supported';
    final screenResolution = await DeviceInfoApi.getScreenResolution();

    if (!mounted) return;

    setState(() => map = {
          'IP Address': ipAddress,
          'Device': device,
          'Device OS Version': deviceVersion,
          'Operating System': operatingSystem,
          'Screen Resolution': screenResolution,
          '': '',
          'App Version': appVersion,
          PlatformIndentify.deviceType == DeviceType.isAndroid ? 'Package Name' : 'Bundle ID': packageName,
        });
  }

  @override
  Widget build(BuildContext context) {
    return InfoWidget(map: map);
  }
}
