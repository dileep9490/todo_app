import 'package:flutter/material.dart';

class InputFormField extends StatelessWidget {
  String labelText;
  TextEditingController controller;
  final String? Function(String?) validator;
  InputFormField({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none),
        labelText: labelText,
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: const EdgeInsets.only(
          left: 20,
          top: 10,
          bottom: 10,
          right: 10,
        ),
      ),
      validator: validator,
    );
  }
}
