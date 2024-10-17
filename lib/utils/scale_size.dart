import 'dart:math';
import 'package:flutter/material.dart';

class ScaleSize {
  static TextScaler textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    double scaler = max(1, min(val, maxTextScaleFactor));
    return TextScaler.linear(scaler);
  }
}
