import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class RelaxTextWidget extends StatelessWidget {
  const RelaxTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
        letterSpacing: 0.5,
        color: Colors.white,
      ),
      child: AnimatedTextKit(
          totalRepeatCount: 1,
          repeatForever: false,
          animatedTexts: [
            RotateAnimatedText('Look at something'),
            RotateAnimatedText('20 feets away'),
            RotateAnimatedText("Breathe"),
            RotateAnimatedText("Hold"),
            RotateAnimatedText("Hold"),
            RotateAnimatedText("Almost there"),
            RotateAnimatedText("You've done it!"),
          ]),
    );
  }
}
