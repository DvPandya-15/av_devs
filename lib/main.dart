import 'package:av_devs/view/create_employee_screen.dart';
import 'package:av_devs/view/home_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wolf soft',
      getPages: [
        GetPage(name: '/', page: () => HomePageScreen()),
        GetPage(
            name: '/create_employee', page: () => const CreateEmployeeScreen()),
      ],
      initialRoute: '/',
    );
  }
}
