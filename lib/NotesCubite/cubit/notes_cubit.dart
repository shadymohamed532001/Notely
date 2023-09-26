import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notely/Models/NoteModel.dart';
import 'package:notely/constans.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? NotesList;

  FitchAllData() {
    var Notebox = Hive.box<NoteModel>(kNoteBox);
    NotesList = Notebox.values.toList();
    emit(NotesSucsess());
  }

  Future createAcount({required String email, required String password}) async {
    emit(CreateAcountLoading());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(CreateAcountSucsess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        emit(CreateAcountFalieur());
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        emit(CreateAcountFalieur());
      }
    }
  }
}
