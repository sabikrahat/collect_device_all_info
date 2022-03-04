import '../../api/platform_indentify.dart';
import '../infos/device_info_page.dart';
import '../infos/application_info_page.dart';
import '../infos/network_info_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${PlatformIndentify.device}\'s Info'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text('Flutter Approach'),
                accountEmail: Text('Md. Sabik Alam Rahat'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/app-icon-1024x1024.png",
                  ),
                ),
              ),
              ListTile(
                selectedColor: Colors.blue,
                selected: index == 1,
                leading: const Icon(Icons.device_unknown_rounded),
                title: const Text('Device Info'),
                onTap: () {
                  Navigator.pop(context);
                  if (index != 1) {
                    setState(() => index = 1);
                  }
                },
              ),
              ListTile(
                selectedColor: Colors.blue,
                selected: index == 2,
                leading: const Icon(Icons.contact_support_outlined),
                title: const Text('Application Info'),
                onTap: () {
                  Navigator.pop(context);
                  if (index != 2) {
                    setState(() => index = 2);
                  }
                },
              ),
              ListTile(
                selectedColor: Colors.blue,
                selected: index == 3,
                leading: const Icon(Icons.network_check_rounded),
                title: const Text('Network Info'),
                onTap: () {
                  Navigator.pop(context);
                  if (index != 3) {
                    setState(() => index = 3);
                  }
                },
              ),
            ],
          ),
        ),
        body: index == 1
            ? const DeviceInfoPage()
            : index == 2
                ? const ApplicationInfoPage()
                : index == 3
                    ? const NetworkInfoPage()
                    : const Center(
                        child: Text(
                            'Hello there..!\nIf you can see this text you\'re genius.😜',
                            textAlign: TextAlign.center)));
  }
}
