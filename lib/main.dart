import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'page/wrapper.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Device Infos',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Wrapper(),
    );
  }
}

