import 'dart:ui';

import 'package:flutter/material.dart';

import 'widgets/registration_data_widget.dart';

// ignore: must_be_immutable
class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background_image.jpg"),
                  fit: BoxFit.fitHeight),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
              child: SizedBox(
                height: size.height,
                width: size.width,
              ),
            ),
          ),
          registrationDataWidget(
              context: context,
              size: size,
              emailController: emailController,
              passwordController: passwordController),
        ],
      ),
    );
  }
}
