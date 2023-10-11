import 'package:flutter/material.dart';
import 'package:notely/Core/constans.dart';

class CustomBottomNavigation
    extends StatelessWidget {
  const CustomBottomNavigation({
    super.key,
  });

  @override
  Widget
      build(BuildContext context) {
    return MaterialButton(
      color: const Color.fromARGB(255, 170, 164, 164),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      onPressed: () {
        Navigator.pushNamedAndRemoveUntil(context, kRegisterView, (route) => false);
      },
      child: const Text(
        'Register',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
