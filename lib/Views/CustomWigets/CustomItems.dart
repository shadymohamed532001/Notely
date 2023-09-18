import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notely/Models/NoteModel.dart';
import 'package:notely/NotesCubite/cubit/notes_cubit.dart';
import 'package:notely/Views/CustomWigets/EditNoteView.dart';

class CustomItems extends StatelessWidget {
  const CustomItems({super.key, this.onTap, required this.notes});
  final Function()? onTap;

  final NoteModel notes;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditNoteView(Note: notes);
            },
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                Color(notes.color),
              ]),
          // color: const Color.fromARGB(255, 175, 172, 122),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(11),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Text(
                      notes.title,
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        notes.delete();
                        BlocProvider.of<NotesCubit>(context).FitchAllData();
                      },
                      icon: const Icon(
                        Icons.delete,
                        size: 20,
                        color: Colors.black,
                      )),
                ],
              ),
              Expanded(
                child: Text(
                  notes.subtitle,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '${notes.date}',
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color.fromARGB(255, 12, 11, 11),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
