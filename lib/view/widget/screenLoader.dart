import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../utlis/global.color.dart';

class LoaderAnimation extends StatelessWidget {
  const LoaderAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: LoadingAnimationWidget.threeArchedCircle(
          color: GlobalColors.primaryColor,
          size: 50,
        ),
      ),
    );
  }
}