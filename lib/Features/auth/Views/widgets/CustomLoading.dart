import 'package:flutter/material.dart';
import 'package:notely/Core/constans.dart';

class CustomLoading
    extends StatelessWidget {
  const CustomLoading({
    super.key,
  });

  @override
  Widget
      build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.white,
            KprimeColor,
          ],
        ),
      ),
      child: const Center(
        child: CircularProgressIndicator(
          color: KprimeColor,
        ),
      ),
    );
  }
}
