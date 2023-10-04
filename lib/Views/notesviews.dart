import 'package:flutter/material.dart';
import 'package:notely/Views/CustomWigets/NotesViewsBody.dart';

class NotesViews extends StatelessWidget {
  const NotesViews({super.key, this.username});
  final String? username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotesViewsBody(
        username: username,
      ),
    );
  }
}
