import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notely/Models/NoteModel.dart';
import 'package:notely/Features/EditNote/Views/widgets/ColorsListViews.dart';
import 'package:notely/Core/widgets/CustomTextFormFiled.dart';
import 'package:notely/add_note_cubite/cubit/add_note_cubite.dart';
import 'package:notely/Core/constans.dart';

class AddNoteForm
    extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() =>
      _AddNoteFormState();
}

class _AddNoteFormState
    extends State<AddNoteForm> {
  final GlobalKey<FormState>
      formKey =
      GlobalKey<FormState>();
  AutovalidateMode?
      autovalidateMode =
      AutovalidateMode.disabled;

  String?
      title,
      subtitle;
  NoteModel?
      note;
  @override
  Widget
      build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
            Colors.white,
            const Color.fromARGB(255, 71, 29, 29).withOpacity(0.80)
          ]),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(34),
            topRight: Radius.circular(34),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Add Your Own Note',
                style: TextStyle(
                  color: Color.fromARGB(255, 58, 24, 24),
                  fontFamily: 'latin',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormFiled(
                obscureText: false,
                // obscureText: true,
                onSaved: (value) {
                  title = value;
                },
                hintText: 'title',
                validator: (value) {
                  // law el kema b null 7otha b true ya3ne koklo b true
                  if (value?.isEmpty ?? true) {
                    return 'title is required ';
                  } else
                    return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormFiled(
                obscureText: false,
                // obscureText: true,
                hintText: 'subtitle',
                onSaved: (value) {
                  subtitle = value;
                },
                validator: (value) {
                  // law el kema b null 7otha b true ya3ne koklo b true
                  if (value?.isEmpty ?? true) {
                    return 'Subtitle is required ';
                  } else
                    return null;
                },
                maxLine: 6,
              ),
              const SizedBox(
                height: 10,
              ),
              const ColorsListView(),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)), backgroundColor: const Color.fromARGB(255, 255, 253, 253).withOpacity(0.30)),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();

                        var olddate = DateTime.now();
                        var currentdate = DateFormat.yMMMEd().format(olddate);
                        var note = NoteModel(
                          date: currentdate.toString(),
                          color: BlocProvider.of<AddNoteCubite>(context).color.value,
                          title: title!,
                          subtitle: subtitle!,
                        );
                        BlocProvider.of<AddNoteCubite>(context).addNote(note);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                    child: const Text(
                      'subtitle',
                      style: TextStyle(
                        color: KprimeColor,
                        fontSize: 22,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
