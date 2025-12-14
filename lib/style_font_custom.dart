import 'package:flutter/material.dart';

TextStyle styleSmallFont({
  Color colorFont = Colors.black,
  bool isBold = false,
}) {
  return TextStyle(
    fontSize: 8,
    color: colorFont,
    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
  );
}


TextStyle styleMediumFont({
  Color colorFont = Colors.black,
  bool isBold = false,
}) {
  return TextStyle(
    fontSize: 12,
    color: colorFont,
    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
  );
}
