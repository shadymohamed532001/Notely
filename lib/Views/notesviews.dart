import 'package:flutter/material.dart';
import 'package:notely/Views/CustomWigets/NotesViewsBody.dart';

class NotesViews extends StatelessWidget {
  const NotesViews({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NotesViewsBody(),
    );
  }
}
