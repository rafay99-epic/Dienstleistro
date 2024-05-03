import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 10,
      duration: const Duration(seconds: 2),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      behavior: SnackBarBehavior.floating,
      content: Text(
        message,
        style: TextStyle(
          color: Theme.of(context).colorScheme.background,
          fontSize: 15,
        ),
      ),
    ),
  );
}
