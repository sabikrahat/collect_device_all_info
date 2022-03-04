import '../../api/network_info_api.dart';
import '../../widget/info_widget.dart';
import 'package:flutter/material.dart';

class NetworkInfoPage extends StatefulWidget {
  const NetworkInfoPage({Key? key}) : super(key: key);

  @override
  _NetworkInfoPageState createState() => _NetworkInfoPageState();
}

class _NetworkInfoPageState extends State<NetworkInfoPage> {
  Map<String, dynamic> networkInfo = {};

  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    final networkInfo = await NetworkInfoApi.getNetworkInfo();


    if (!mounted) return;

    setState(() => this.networkInfo = networkInfo);
  }

  @override
  Widget build(BuildContext context) {
    return InfoWidget(map: networkInfo);
  }
}
