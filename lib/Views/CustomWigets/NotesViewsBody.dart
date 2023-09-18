import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notely/Models/NoteModel.dart';
import 'package:notely/NotesCubite/cubit/notes_cubit.dart';
import 'package:notely/Views/CustomWigets/AddNoteBottomSheet.dart';
import 'package:notely/Views/CustomWigets/CustomAppBar.dart';
import 'package:notely/Views/CustomWigets/CustomItems.dart';
import 'package:notely/Views/CustomWigets/CustomSearchBar.dart';
import 'package:notely/Views/CustomWigets/CutomHellowBar.dart';

class NotesViewsBody extends StatefulWidget {
  const NotesViewsBody({super.key});

  @override
  State<NotesViewsBody> createState() => _NotesViewsBodyState();
}

class _NotesViewsBodyState extends State<NotesViewsBody> {
  late List<NoteModel> searchedfornote;
  final _controller = TextEditingController();

  Widget _buildSearchfiled() {
    return TextField(
      onChanged: (searchednote) {
        addserchedforitemstolist(searchednote);
      },
      style: const TextStyle(
        // color: const Color.fromARGB(255, 67, 64, 64),
        fontSize: 16,
      ),
      controller: _controller,
      cursorColor: Colors.black,
      decoration: InputDecoration(
          counterStyle: const TextStyle(fontSize: 12),
          hintText: 'search',
          border: InputBorder.none,
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
          )),
    );
  }

  void addserchedforitemstolist(String serachedcaracter) {
    searchedfornote = BlocProvider.of<NotesCubit>(context)
        .NotesList!
        .where((character) =>
            character.title.toLowerCase().startsWith(serachedcaracter))
        .toList();
    setState(() {});
  }

  Widget NotesListViews() {
    return BlocConsumer<NotesCubit, NotesState>(
      listener: (context, state) {
        if (state is NotesSucsess) {}
      },
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).NotesList!;

        return Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 200,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 3,
                ),
                padding: EdgeInsets.zero,
                itemCount: _controller.text.isEmpty
                    ? notes.length
                    : searchedfornote.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: CustomItems(
                      notes: _controller.text.isEmpty
                          ? notes[index]
                          : searchedfornote[index],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).FitchAllData();
    super.initState();
  }

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
            padding: const EdgeInsets.all(14),
            child: Column(children: [
              const CustomAppBar(
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomSearchBar(
                child: _buildSearchfiled(),
              ),
              const SizedBox(
                height: 10,
              ),
              const CutomHellowBar(),
              Expanded(
                child: NotesListViews(),
              )
            ]),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:
            const Color.fromARGB(255, 71, 29, 29).withOpacity(0.80),
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(34),
                      topRight: Radius.circular(34))),
              context: context,
              builder: (context) {
                return const AddNoteBottomSheet();
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
