import 'package:flutter/material.dart';

class CustomSpace
    extends StatelessWidget {
  const CustomSpace({
    super.key,
    required this.Number,
  });
  final int
      Number;
  @override
  Widget
      build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / Number,
    );
  }
}
