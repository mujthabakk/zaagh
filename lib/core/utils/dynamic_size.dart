import 'package:flutter/material.dart';

extension DynamicSize on BuildContext {
  double h(double height) {
    return MediaQuery.sizeOf(this).height * (height / 1024);
  }

  double w(double width) {
    return MediaQuery.sizeOf(this).width * (width / 467);
  }
}
