import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notely/Models/NoteModel.dart';
import 'package:notely/NotesCubite/cubit/notes_cubit.dart';
import 'package:notely/Views/CustomWigets/CustomAppBar.dart';
import 'package:notely/Views/CustomWigets/CustomTextFormFiled.dart';
import 'package:notely/Views/CustomWigets/EditNoteColorsListView.dart';

class EditNotesBodyView extends StatefulWidget {
  const EditNotesBodyView({super.key, required this.Notes});

  final NoteModel Notes;

  @override
  State<EditNotesBodyView> createState() => _EditNotesViewState();
}

class _EditNotesViewState extends State<EditNotesBodyView> {
  String? tittle, subtitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [
              Colors.white,
              Colors.grey.withOpacity(0.66),
              const Color.fromARGB(255, 71, 41, 41).withOpacity(0.77),
            ])),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(14),
            child: Column(
              children: [
                CustomAppBar(
                  onPressed: () {
                    widget.Notes.title = tittle ?? widget.Notes.title;
                    widget.Notes.subtitle = subtitle ?? widget.Notes.subtitle;
                    BlocProvider.of<NotesCubit>(context).FitchAllData();
                    widget.Notes.save();
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.check,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormFiled(
                  onChanged: (value) {
                    tittle = value;
                  },
                  hintText: widget.Notes.title,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormFiled(
                  onChanged: (value) {
                    subtitle = value;
                  },
                  hintText: widget.Notes.subtitle,
                  maxLine: 6,
                ),
                SizedBox(
                  height: 14,
                ),
                EditNoteColorsListView(
                  note: widget.Notes,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
