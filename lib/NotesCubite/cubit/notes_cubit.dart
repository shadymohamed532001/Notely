// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notely/Models/NoteModel.dart';
import 'package:notely/Core/constans.dart';

part 'notes_state.dart';

class NotesCubit
    extends Cubit<NotesState> {
  NotesCubit()
      : super(NotesInitial());

  List<NoteModel>?
      NotesList;

  FitchAllData() {
    var Notebox =
        Hive.box<NoteModel>(kNoteBox);
    NotesList =
        Notebox.values.toList();
    emit(NotesSucsess());
  }
}
