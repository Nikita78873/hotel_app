import 'package:flutter/material.dart';

Widget peculiaritiesWidget({
  required String name,
  required BuildContext context,
}) {
  return IntrinsicWidth(
    child: Text(
      name,
      style: TextStyle(
        color: Color.fromARGB(255, 130, 135, 150),
        backgroundColor: Color.fromARGB(255, 251, 251, 252),
      ),
    ),
  );
}
