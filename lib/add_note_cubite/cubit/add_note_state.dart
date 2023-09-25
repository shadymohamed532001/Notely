import 'package:flutter/material.dart';

@immutable
class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteSucess extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNoteFailer extends AddNoteState {
  final String error;

  AddNoteFailer({required this.error});
}
