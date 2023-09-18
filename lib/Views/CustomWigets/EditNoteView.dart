import 'package:flutter/material.dart';
import 'package:notely/Models/NoteModel.dart';
import 'package:notely/Views/EditNotesViewBody.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.Note});
  // ignore: non_constant_identifier_names
  final NoteModel Note;

  @override
  Widget build(BuildContext context) {
    return EditNotesBodyView(
      Notes: Note,
    );
  }
}
