import 'package:flutter/material.dart';

Widget customIconButton({required IconData icon, onPressed}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color(0xFF3B3B3B), borderRadius: BorderRadius.circular(10)),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    ),
  );
}
