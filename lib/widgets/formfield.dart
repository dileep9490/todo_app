import 'package:flutter/material.dart';

class InputFormField extends StatelessWidget {
  String labelText;
  InputFormField({
    Key? key,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.only(left: 20),
      child: Form(
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: labelText,
          ),
        ),
      ),
    );
  }
}
