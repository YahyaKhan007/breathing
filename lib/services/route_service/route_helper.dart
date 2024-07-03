import 'package:get/get.dart';

import '../../ui/screens/screens.dart';

class RouterHelper {
  static const String onboarding = '/onboarding';

  static const String splash = '/splash';
  static const String musicPlayerScreen = '/musicPlayerScreen';
  static const String homeScreen = '/homeScreen';

  static const String login = '/login';
  static const String register = '/register';

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: onboarding, page: () => const OnboardingScreen()),
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: musicPlayerScreen, page: () => const MusicPlayerScreen(music: null,)),
    GetPage(name: homeScreen, page: () => const HomeScreen()),
    GetPage(name: register, page: () => RegistrationScreen()),
  ];
}
