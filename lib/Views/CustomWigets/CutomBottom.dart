import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom(
      {super.key,
      required this.title,
      this.icon,
      this.backgroundColor,
      this.onPressed,
      this.width});

  final String title;
  final IconData? icon;
  final void Function()? onPressed;
  final double? width;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: 60,
        decoration: BoxDecoration(
          // color: Colors.grey.withOpacity(0.55),
          borderRadius: BorderRadius.circular(24),
        ),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                backgroundColor: backgroundColor),
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 56, 21, 21),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 3.0),
                ),
                Icon(
                  icon,
                  color: const Color.fromARGB(255, 54, 27, 27),
                )
              ],
            )));
  }
}
