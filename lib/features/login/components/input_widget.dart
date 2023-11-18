import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputWidget extends StatelessWidget {
  final String title;
  final Icon icon;
  final bool isPassword;
  final double height;
  final FormFieldValidator<String>? validator;
  const InputWidget({
    super.key,
    required this.title,
    required this.icon,
    this.isPassword = false,
    this.height = 15,
    this.validator,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        TextFormField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: height),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: icon,
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              helperStyle: const TextStyle(color: Colors.white)),
          validator: validator,
          obscureText: isPassword,
          inputFormatters: isPassword
              ? [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'[a-zA-Z0-9]'),
                  ),
                ]
              : [],
          maxLength: 20,
        )
      ],
    );
  }
}
