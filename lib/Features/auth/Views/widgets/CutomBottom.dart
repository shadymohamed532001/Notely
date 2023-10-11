import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({
    super.key,
    this.onTap,
    required this.icon,
    this.style,
    required this.number,
    this.text,
  });
  final void Function()? onTap;
  final TextStyle? style;
  final String? text;
  final double number;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height / 13.5,
        width: MediaQuery.of(context).size.width / number,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 171, 163, 163),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              text!,
              style: style,
            ),
            IconButton(
              onPressed: () {},
              icon: icon,
            )
          ],
        ),
      ),
    );
  }
}
