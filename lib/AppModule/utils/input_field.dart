import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final String? hintText;
  final bool readOnly;

  const InputField(
      {Key? key, required this.controller, this.keyboardType, this.validator, this.textInputAction, this.hintText,this.readOnly =false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      readOnly: readOnly,
      textInputAction: textInputAction ?? TextInputAction.next,
      decoration: InputDecoration(
          hintText: hintText ?? 'Email',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10))),
      validator: validator,
    );
  }
}
