import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:lahzat_web/views/pages/selection%20page/selection_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SettingsPage(),
      home: SelectionPage(),
    );
  }
}
