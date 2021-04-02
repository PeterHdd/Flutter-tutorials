import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  final TextEditingController controller; 
  final String name;
  final String? Function(String?)? validator;
  final int? maxLines;
  final TextInputType? type;

  TextFields({required this.controller, required this.name, required this.validator,this.maxLines,this.type});
  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border = OutlineInputBorder(borderRadius: BorderRadius.circular(40.0),borderSide: BorderSide.none);
    return  Padding(
        padding: EdgeInsets.all(20.0),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
           keyboardType: type,
          maxLines: maxLines,
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.grey[300],
            filled: true,
            labelText: name,
            focusedErrorBorder: border,
            focusedBorder: border,
            enabledBorder: border,
            errorBorder: border,
          ),
          // The validator receives the text that the user has entered.
          validator: validator,
        ),
    );
  }
}
