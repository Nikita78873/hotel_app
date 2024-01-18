import 'package:flutter/material.dart';

Widget advantagesTileWidget({
  required Widget iconwidget,
  required String subtitle,
  required String text,
  required BuildContext context,
}) {
  return ListTile(
    leading: iconwidget,
    subtitle: Text(
      subtitle,
      style: TextStyle(
        fontSize: 14,
        color: Color.fromARGB(255, 130, 135, 150),
      ),
    ),
    trailing: const Icon(Icons.arrow_forward_ios),
    title: Text(
      text,
      style: TextStyle(fontSize: 16),
    ),
  );
}
