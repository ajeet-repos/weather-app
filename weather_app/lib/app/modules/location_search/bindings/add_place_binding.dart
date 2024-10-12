import 'package:get/get.dart';
import 'package:weather_app/app/controllers/app_controller.dart';

class AddPlaceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppController>(
        () => AppController()
    );
  }
}