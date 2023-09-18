import 'package:flutter/material.dart';

@immutable
sealed class AddNoteState {}

final class AddNoteInitial extends AddNoteState {}

final class AddNoteSucess extends AddNoteState {}

final class AddNoteLoading extends AddNoteState {}

final class AddNoteFailer extends AddNoteState {
  final String error;

  AddNoteFailer({required this.error});
}
