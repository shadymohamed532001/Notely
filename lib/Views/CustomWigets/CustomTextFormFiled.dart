import 'package:flutter/material.dart';
import 'package:notely/Helper/constans.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    this.onChanged,
    this.onFieldSubmitted,
    this.onSaved,
    required this.hintText,
    this.maxLine = 1,
    this.filled,
    this.fillColor,
    this.controller,
    required this.obscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.validator,
  });

  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String hintText;
  final int? maxLine;
  final bool obscureText;
  final bool? filled;
  final TextEditingController? controller;
  final Color? fillColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (Event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      maxLines: maxLine,
      obscureText: obscureText,
      keyboardType: keyboardType,
      controller: controller,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      validator: validator,
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return 'Failed is required';
      //   }
      //   return null;
      // },
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          suffixIconColor: const Color.fromARGB(255, 101, 98, 98),
          prefixIcon: prefixIcon,
          filled: filled,
          fillColor: fillColor,
          errorBorder: buildOutlineInputBorder(Colors.red),
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
