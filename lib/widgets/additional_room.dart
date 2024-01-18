import 'package:flutter/material.dart';

Widget addroominfo(String celltext) {
  return Container(
    decoration: const BoxDecoration(
      color: Color.fromARGB(25, 13, 114, 255),
      borderRadius: BorderRadius.all(
        Radius.circular(8.0),
      ),
    ),
    child: IntrinsicWidth(
      child: ListTile(
        textColor: Color.fromARGB(255, 13, 114, 255),
        title: Text(
          celltext,
        ),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    ),
  );
}
