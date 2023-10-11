import 'package:flutter/material.dart';
import 'package:notely/Models/NoteModel.dart';
import 'package:notely/Features/EditNote/Views/widgets/ColorsListViews.dart';
import 'package:notely/Core/constans.dart';

class EditNoteColorsListView
    extends StatefulWidget {
  const EditNoteColorsListView(
      {super.key,
      required this.note});
  final NoteModel
      note;

  @override
  State<EditNoteColorsListView> createState() =>
      _EditNoteColorsListViewState();
}

class _EditNoteColorsListViewState
    extends State<EditNoteColorsListView> {
  int currentindex =
      0;

  @override
  Widget
      build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(2),
            child: GestureDetector(
              onDoubleTap: () {
                currentindex = index;
                widget.note.color = colors[index].value;
                setState(() {});
              },
              child: ColorsItem(
                isactive: currentindex == index,
                color: colors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
