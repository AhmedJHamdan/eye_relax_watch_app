import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';

class DashedCircularRelaxProgress extends StatelessWidget {
  const DashedCircularRelaxProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashedCircularProgressBar.aspectRatio(
      animationDuration: Duration(seconds: 20),
      animation: true,
      maxProgress: 100,
      progress: 100,
      aspectRatio: 1,
      sweepAngle: 360,
      startAngle: 1,
      foregroundStrokeWidth: 2.5,
      animationCurve: Curves.linear,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white24,
      seekColor: Colors.white60,
      seekSize: 2,
    );
  }
}
