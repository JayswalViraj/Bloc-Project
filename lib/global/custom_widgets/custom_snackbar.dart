import 'package:flutter/material.dart';

void customeSnackbar(BuildContext context, String message, bool isSuccess) {
  final snackBar = SnackBar(
    content: Row(
      children: [
        Icon(
          isSuccess ? Icons.check_circle : Icons.error,
          color: isSuccess ? Colors.green : Colors.red,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            message,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    ),
    backgroundColor: Colors.black87,
    behavior: SnackBarBehavior.floating, // Makes it appear above the bottom bar
    duration: Duration(seconds: 3),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}