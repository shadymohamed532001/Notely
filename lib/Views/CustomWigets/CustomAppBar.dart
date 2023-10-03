import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, this.onTap, required this.icon, this.onPressed});
  final Function()? onTap;
  final Widget icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: onTap,
            child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.07),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_sharp,
                    size: 22,
                  ),
                ))),
        const SizedBox(
          width: 11,
        ),
        const Text(
          'Hi,Shady',
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 23,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.07),
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              onPressed: onPressed,
              icon: icon,
            )),
      ],
    );
  }
}
