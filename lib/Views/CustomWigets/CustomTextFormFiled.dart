import 'package:flutter/material.dart';
import 'package:notely/constans.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    this.onChanged,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    required this.hintText,
    this.maxLine = 1,
    this.filled,
    this.fillColor,
    this.controller,
  });

  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String hintText;
  final int? maxLine;
  final bool? filled;
  final TextEditingController? controller;
  final Color? fillColor;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (Event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      maxLines: maxLine,
      controller: controller,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      validator: validator,
      decoration: InputDecoration(
          filled: filled,
          fillColor: fillColor,
          border: buildOutlineInputBorder(),
          focusedBorder:
              buildOutlineInputBorder(const Color.fromARGB(255, 66, 21, 21)),
          enabledBorder: buildOutlineInputBorder(),
          hintText: hintText,
          hintStyle: TextStyle(
            color: KprimeColor.withOpacity(0.80),
          )),
    );
  }
}

OutlineInputBorder buildOutlineInputBorder([color]) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide:
          BorderSide(color: color ?? Color.fromARGB(255, 196, 187, 187)));
}
