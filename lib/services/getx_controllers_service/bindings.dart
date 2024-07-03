import 'package:breathing_app/services/getx_controllers_service/file_picker_controller/file_picker_controller.dart';
import 'package:get/get.dart';

import '../services.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
    Get.put(FilePickerController());
  }
}
