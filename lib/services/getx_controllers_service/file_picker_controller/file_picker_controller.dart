import 'package:get/get.dart';

class FilePickerController extends GetxController {
  RxBool isUploading = false.obs;
  RxString fileName = ''.obs;
}
