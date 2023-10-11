import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notely/Models/NoteModel.dart';
import 'package:notely/add_note_cubite/cubit/add_note_state.dart';
import 'package:notely/Core/constans.dart';

class AddNoteCubite
    extends Cubit<AddNoteState> {
  AddNoteCubite()
      : super(AddNoteInitial());
  Color
      color =
      const Color(0xff540b0e);

  addNote(
      NoteModel note) async {
    note.color =
        color.value;
    try {
      var noteBox = Hive.box<NoteModel>(kNoteBox);

      await noteBox.add(note);
      emit(AddNoteSucess());
    } catch (e) {
      emit(AddNoteFailer(error: e.toString()));
    }
  }
}
