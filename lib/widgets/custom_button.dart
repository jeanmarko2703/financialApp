import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.isActive,
    required this.text,
    this.onPressed,
  });
  final bool isActive;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: isActive ? Colors.green : Colors.white),
        ));
  }
}
