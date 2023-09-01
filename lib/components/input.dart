import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  List<TextInputFormatter>? inputFormatters;
  final bool hasValidator;

  Input({
    required this.label,
    required this.controller,
    this.onChanged,
    this.keyboardType,
    this.inputFormatters,
    this.hasValidator = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
      ),
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChanged,
      validator: (value) {
        if (!hasValidator) return null;

        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}
