import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWidget {
  static Widget showInkDrop(
      {required BuildContext context, required double size, Color? color}) {
    return LoadingAnimationWidget.inkDrop(
      color: color ?? Colors.white,
      size: size,
    );
  }
}
