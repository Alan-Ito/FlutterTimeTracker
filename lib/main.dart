import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytimetrackerapp/pages/list/view/list.dart';
import 'package:mytimetrackerapp/pages/list/bindings/list_binding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: "/home", page: () => ListScreen(), binding: ListBinding()),
      ],
      initialRoute: "/home",
    );
  }
}
