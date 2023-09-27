import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: 120,
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            color: const Color.fromARGB(255, 208, 207, 207)),
        child: Image.asset(
          'assets/images/Design inspiration-pana.png',
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
