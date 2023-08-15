import 'package:flutter/material.dart';

class MenuJourContainer extends Container {
  MenuJourContainer({super.key, Widget? child})
      : super(
    constraints: const BoxConstraints(
      minWidth: 75,
      maxWidth: 200,
      minHeight: 90,
      maxHeight: 200,
    ),
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.black,
        width: 1.0,
      ),
    ),
    height: 100,
    child: child,
  );
}