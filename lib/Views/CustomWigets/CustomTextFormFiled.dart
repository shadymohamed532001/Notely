import 'package:flutter/material.dart';
import 'package:notely/constans.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled(
      {super.key,
      this.onChanged,
      this.onFieldSubmitted,
      this.onSaved,
      this.validator,
      required this.hintText,
      this.maxLine = 1});

  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String hintText;
  final int? maxLine;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      validator: validator,
      decoration: InputDecoration(
          border: buildOutlineInputBorder(),
          focusedBorder:
              buildOutlineInputBorder(const Color.fromARGB(255, 66, 21, 21)),
          enabledBorder: buildOutlineInputBorder(),
          hintText: hintText,
          hintStyle: const TextStyle(
            wordSpacing: 4.3,
            color: KprimeColor,
          )),
    );
  }
}

OutlineInputBorder buildOutlineInputBorder([color]) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: BorderSide(color: color ?? Colors.white));
}
