// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notely/NotesCubite/cubit/notes_cubit.dart';
import 'package:notely/Views/CustomWigets/AddNoteForm.dart';
import 'package:notely/add_note_cubite/cubit/add_note_cubite.dart';
import 'package:notely/add_note_cubite/cubit/add_note_state.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubite(),
      child: BlocConsumer<AddNoteCubite, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSucess) {
            BlocProvider.of<NotesCubit>(context).FitchAllData();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: const SingleChildScrollView(
              child: AddNoteForm(),
            ),
          );
        },
      ),
    );
  }
}
