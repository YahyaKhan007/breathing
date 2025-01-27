import 'package:breathing_app/blocs/authentication/authentication_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uuid/uuid.dart';

import 'blocs/bloc.dart';
import 'firebase_options.dart';
import 'services/services.dart';

var uuid = const Uuid();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final box = GetStorage();
  box.read('isFirstTime') ?? box.write('isFirstTime', true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: ((context) => OnboardingBloc())),
            BlocProvider(
                create: ((context) => AuthenticationBloc(AuthService()))),
            BlocProvider(
              create: ((context) => SplashBloc(
                    authService: AuthService(),
                    dbService: DatabaseService(),
                  )),
            ),
          ],
          child: GetMaterialApp(
            debugShowCheckedModeBanner: true,
            initialBinding: ControllerBindings(),
            title: 'Breathing App',
            // You can use the library anywhere in the app even in theme
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),

            getPages: RouterHelper.routes,
            initialRoute: RouterHelper.splash,
            navigatorKey: Get.key,
          ),
        );
      },
    );
  }
}
