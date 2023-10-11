import 'package:flutter/material.dart';

class CustomPopUpMenu
    extends StatelessWidget {
  const CustomPopUpMenu({
    super.key,
    this.onTapItem1,
    this.onTapItem2,
    this.onTapItem3,
  });
  final void Function()?
      onTapItem1;
  final void Function()?
      onTapItem2;
  final void Function()?
      onTapItem3;
  @override
  Widget
      build(BuildContext context) {
    return PopupMenuButton(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        constraints: const BoxConstraints.expand(width: 130, height: 115),
        elevation: 0.0,
        enableFeedback: true,
        // splashRadius: 12.3,
        color: const Color.fromARGB(240, 245, 241, 241),
        shape: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(209, 202, 194, 194)),
          borderRadius: BorderRadius.circular(12),
        ),
        icon: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        itemBuilder: (BuildContext bc) {
          return [
            PopupMenuItem(
              onTap: onTapItem1,
              child: const Text("Contact Us"),
            ),
            PopupMenuItem(
              onTap: onTapItem2,
              child: const Text("Sign Out"),
            ),
          ];
        });
  }
}
