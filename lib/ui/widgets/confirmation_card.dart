import 'package:flutter/material.dart';

class Confirmation extends StatelessWidget {
  const Confirmation({
    super.key,
    required this.message,
    required this.tittle,
    this.confirmAction,
  });

  final String tittle;

  final String message;

  final void Function()? confirmAction;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(tittle),
      content: Text(message),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.red),
          ),
        ),
        ElevatedButton(
          onPressed: confirmAction,
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
