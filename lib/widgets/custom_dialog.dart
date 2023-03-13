import 'package:flutter/material.dart';
import 'package:jogodavelha/core/constants.dart';

class CustomDialogs extends StatelessWidget {
  final String title;
  final String message;
  final Function onPressed;

  const CustomDialogs({
    required this.title,
    required this.message,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        ElevatedButton(
          child: Text(RESET_BUTTON_LABEL),
          onPressed: () {
            Navigator.pop(context);
            onPressed();
          },
        ),
      ],
    );
  }
}
