import 'package:flutter/material.dart';
import 'package:flutter_provider/screen/base_screen.dart';
import 'package:get/get.dart';
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  BaseScreen(),
    );
  }
}
