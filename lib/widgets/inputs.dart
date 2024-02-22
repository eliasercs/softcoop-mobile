import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String labelTxt;
  final String placeholder;
  final Icon? icon;
  final bool? enabled;

  const TextInput(
      {super.key,
      required this.labelTxt,
      required this.placeholder,
      this.icon,
      this.enabled});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: Color(0xFF737373))),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: Color(0xFF38B549))),
          labelStyle: const TextStyle(
              color: Color(0xFF737373), fontSize: 18, fontFamily: "Poppins"),
          labelText: labelTxt,
          enabled: enabled ?? true,
          filled: true,
          fillColor: const Color(0xFFF5F5F5),
          prefixIcon: icon,
          prefixIconColor: const Color(0xFF737373),
          hintText: placeholder,
          focusColor: const Color(0xFF38B549),
          hintStyle:
              const TextStyle(color: Color(0xFF737373), fontFamily: "Poppins")),
    );
  }
}
