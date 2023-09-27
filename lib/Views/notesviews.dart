import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notely/Views/CustomWigets/NotesViewsBody.dart';
import 'package:notely/Views/VerifiedView.dart';

class NotesViews extends StatelessWidget {
  const NotesViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FirebaseAuth.instance.currentUser!.emailVerified
          ? NotesViewsBody()
          : VerfideView(),
    );
  }
}
