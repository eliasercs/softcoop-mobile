import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextInput extends StatelessWidget {
  final String labelTxt;
  final String? placeholder;
  final Icon? icon;
  final bool? enabled;
  final String? initialValue;
  final Function onChange;

  const TextInput(
      {super.key,
      required this.labelTxt,
      this.placeholder,
      this.icon,
      this.enabled,
      this.initialValue,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      initialValue: initialValue,
      onChanged: (value) {
        onChange(value);
      },
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
          hintText: placeholder ?? "",
          focusColor: const Color(0xFF38B549),
          hintStyle:
              const TextStyle(color: Color(0xFF737373), fontFamily: "Poppins")),
    );
  }
}

class CustomSwitch extends StatelessWidget {
  const CustomSwitch(
      {super.key,
      this.initialValue,
      required this.onChange,
      required this.content});
  final bool? initialValue;
  final Function onChange;
  final String content;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Switch(
          inactiveTrackColor: const Color(0xFFE2294F),
          activeTrackColor: Colors.green,
          inactiveThumbColor: Colors.white,
          activeColor: Colors.white,
          value: initialValue ?? false,
          onChanged: (value) {
            onChange(value);
          }),
      SizedBox(
        width: size.width * 0.75,
        child: Text(
          content,
          textAlign: TextAlign.justify,
          maxLines: 3,
        ),
      )
    ]);
  }
}
