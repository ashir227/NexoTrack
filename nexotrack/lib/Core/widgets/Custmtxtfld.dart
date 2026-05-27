import 'package:flutter/material.dart';
import 'package:nexotrack/Core/theme/color.dart';

class CstmFld extends StatelessWidget {
  final FormFieldValidator validator;
  final TextEditingController controller;
  const CstmFld({super.key, required this.validator, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: SecColor.textwhclr),
      keyboardType: TextInputType.number,

      validator: validator,
      decoration: InputDecoration(
        fillColor: PrimaryColor.CrdColor,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1.5,
            color: SecColor.borderclr.withOpacity(0.6),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: SecColor.borderclr.withOpacity(0.6),
            width: 1,
          ),
        ),
      ),
    );
  }
}
