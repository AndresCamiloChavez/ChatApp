import 'package:flutter/material.dart';

class ButtonBlue extends StatelessWidget {
  final String text;
  final Color color;
  final Function()? onPressed;

  const ButtonBlue({Key? key, required this.text, required this.color, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 2,
      highlightElevation: 5,
      color: color,
      shape: StadiumBorder(),
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        height: 50,
        child: Center(
            child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 18),
        )),
      ),
    );
  }
}
