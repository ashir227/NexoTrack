import 'package:flutter/material.dart';
import 'package:nexotrack/Core/theme/color.dart';
import 'package:nexotrack/Models/portfolio_model.dart';

class CstmFld extends StatelessWidget {
  // final Function(String) onChanged;
  final FormFieldValidator validator;
  final TextEditingController controller;
  // KeyboardListener key
  const CstmFld({
    super.key,
    // required this.onChanged,
    required this.validator,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: SecColor.textwhclr),
      keyboardType: TextInputType.number,
      controller: controller,
      // onChanged: onChanged,
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
