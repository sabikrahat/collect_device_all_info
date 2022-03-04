import '../api/network_info_api.dart';
import '../api/platform_indentify.dart';
import 'home/home_page.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  Wrapper({Key? key}) : super(key: key);

  final PlatformIndentify platformIndentify = PlatformIndentify();
  final NetworkInfoApi networkInfoApi = NetworkInfoApi();

  @override
  Widget build(BuildContext context) {
    networkInfoApi.enablePlatformOverrideForDesktop();
    platformIndentify.getPlatformInit();
    return const HomePage();
  }
}
