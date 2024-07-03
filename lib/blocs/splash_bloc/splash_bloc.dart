import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../services/services.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AuthService authService;
  final DatabaseService dbService;
  SplashBloc({required this.authService, required this.dbService})
      : super(const SplashState()) {
    on<SplashInitialEvent>(_splashInitial);
  }

  // * Splash Initial Event
  void _splashInitial(
      SplashInitialEvent event, Emitter<SplashState> emit) async {
    final box = GetStorage();
    final userController = Get.find<UserController>();

    final isFirstTime = box.read('isFirstTime');

    await Future.delayed(const Duration(seconds: 1));

    if (isFirstTime == true) {
      Get.offAllNamed(RouterHelper.onboarding);
    } else {
      if (authService.auth.currentUser == null) {
        userController.currentUser.value = null;
        Get.offAllNamed(RouterHelper.register);
      } else {
        final currentUser = await DatabaseService.getUserbyUid(
            uid: authService.auth.currentUser!.uid);
        userController.currentUser.value = currentUser;

        final musicList = await dbService.getAllMusic();

        userController.musicList.value = musicList;

        Get.offAllNamed(RouterHelper.homeScreen);
      }
    }
  }
}
