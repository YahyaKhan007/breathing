import 'package:get/get.dart';

import '../../../models/models.dart';

class UserController extends GetxController {
  Rxn<UserModel> currentUser = Rxn<UserModel>();
  RxList<Music> musicList = <Music>[].obs;

  clearData() {
    currentUser.value = null;
  }
}
