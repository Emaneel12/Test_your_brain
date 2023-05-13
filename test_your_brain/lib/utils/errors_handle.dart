import 'package:flutter/material.dart';

class ErrorHandler {
  static void showError(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
