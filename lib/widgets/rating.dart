import 'package:flutter/material.dart';

Widget ratingWidget({
  required String name,
  required int rating,
  required BuildContext context,
}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.35,
    decoration: BoxDecoration(
      color: const Color.fromARGB(70, 255, 199, 0),
      borderRadius: BorderRadius.all(
        Radius.circular(5.0),
      ),
    ),
    child: Row(
      children: [
        const Icon(
          Icons.star,
          color: Color.fromARGB(255, 255, 168, 0),
        ),
        Text(
          rating.toString(),
          style: const TextStyle(
            color: Color.fromARGB(255, 255, 168, 0),
          ),
        ),
        Text(
          ' ' + name,
          style: const TextStyle(
            color: Color.fromARGB(255, 255, 168, 0),
          ),
        ),
      ],
    ),
  );
}
