import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String labelButton;
  Function() actionButton;
  CustomButton(this.labelButton, this.actionButton, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: actionButton, child: Text(labelButton));
  }
}