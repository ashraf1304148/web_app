import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_app/data/controller/main_controller.dart';
import 'package:web_app/data/repo/main_repo.dart';

Future<void> init() async {
  // sharedpreferences
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  // repo
  Get.lazyPut(() => MainRepo(sharedPreferences: sharedPreferences));
  // Get.lazyPut(() => MainRepo());

  // controllers
  Get.lazyPut(() => MainController(mainRepo: Get.find()));
}
