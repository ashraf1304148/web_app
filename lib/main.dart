import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_app/helper/dependencies.dart' as dep;
import 'package:web_app/data/controller/main_controller.dart';
import 'package:web_app/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (controller) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      );
    });
  }
}
