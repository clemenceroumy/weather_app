import 'package:flutter/material.dart';

class Palette {
  static final gradient = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [Color(0xFF1f5592), Color(0xFF2c3463)],
    ),
  );
}
