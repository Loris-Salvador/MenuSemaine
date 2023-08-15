import 'package:flutter/material.dart';

class MenusPossiblesContainer extends Container {
  MenusPossiblesContainer({super.key, Widget? child})
      : super(
    constraints: const BoxConstraints(
      minWidth: 100,
      maxWidth: 200,
      minHeight: 150,
      maxHeight: 200,
    ),
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.black,
        width: 1.0,
      ),
    ),
    height: 200,
    width: 100,
    child: child,
  );
}