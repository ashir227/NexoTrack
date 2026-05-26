import 'package:flutter/material.dart';

class CstmFld extends StatelessWidget {
  final FormFieldValidator validator;
  const CstmFld({super.key, required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(validator: validator);
  }
}
