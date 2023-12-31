import 'package:flutter/material.dart';

class BookDetailCard extends StatelessWidget {
  const BookDetailCard({
    super.key,
    required this.title,
    required this.data,
    this.editAction,
    this.deleteAction,
  });

  final String title;

  final String data;

  final void Function()? editAction;

  final void Function()? deleteAction;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(
        data,
        style: const TextStyle(fontSize: 18),
      ),
      actions: [
        ElevatedButton(
          onPressed: deleteAction,
          child: const Text(
            'Delete',
            style: TextStyle(color: Colors.red),
          ),
        ),
        ElevatedButton(
          onPressed: editAction,
          child: const Text(
            'Edit',
            style: TextStyle(color: Colors.red),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Close',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
