import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final double? widthBtn;
  final String valueBtn;
  final Function press;
  const Button(
      {super.key, this.widthBtn, required this.valueBtn, required this.press});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TextButton(
        onPressed: () {
          press();
        },
        style: TextButton.styleFrom(
            backgroundColor: const Color.fromRGBO(56, 224, 120, 1),
            fixedSize: Size(widthBtn ?? size.width, 30)),
        child: Text(
          valueBtn,
          style: const TextStyle(color: Colors.black, fontFamily: "Poppins"),
        ));
  }
}
