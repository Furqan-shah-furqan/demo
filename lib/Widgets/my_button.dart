import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    this.color,
    this.textColor,
    required this.text, this.buttonOnTaped,
  });
  final color;
  final textColor;
  final String text;
  final buttonOnTaped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: buttonOnTaped,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: color,
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(color: textColor, fontSize: 23),
              ),
            ),
          ),
        ));
  }
}
