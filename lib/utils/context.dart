import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  void showErrorSnackBar(String text) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(text),
      ),
    );
  }
}
