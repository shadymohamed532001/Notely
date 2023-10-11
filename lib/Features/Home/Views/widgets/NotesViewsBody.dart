import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notely/Models/NoteModel.dart';
import 'package:notely/NotesCubite/cubit/notes_cubit.dart';
import 'package:notely/Features/Home/Views/widgets/AddNoteBottomSheet.dart';
import 'package:notely/Features/Home/Views/widgets/CustomItems.dart';
import 'package:notely/Features/Home/Views/widgets/CustomPopUpMenu.dart';
import 'package:notely/Features/Home/Views/widgets/CustomSearchBar.dart';
import 'package:notely/Features/Home/Views/widgets/CutomHellowBar.dart';
import 'package:notely/Core/constans.dart';

class NotesViewsBody
    extends StatefulWidget {
  const NotesViewsBody(
      {super.key,
      this.username});
  final String?
      username;

  @override
  State<NotesViewsBody> createState() =>
      _NotesViewsBodyState();
}

class _NotesViewsBodyState
    extends State<NotesViewsBody> {
  late List<NoteModel>
      searchedfornote;
  final _controller =
      TextEditingController();

  Widget
      _buildSearchfiled() {
    return TextField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
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

  void addserchedforitemstolist(
      String serachedcaracter) {
    searchedfornote =
        BlocProvider.of<NotesCubit>(context).NotesList!.where((character) => character.title.toLowerCase().startsWith(serachedcaracter)).toList();
    setState(() {});
  }

  Widget
      NotesListViews() {
    return BlocConsumer<NotesCubit,
        NotesState>(
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
                itemCount: _controller.text.isEmpty ? notes.length : searchedfornote.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: CustomItems(
                      notes: _controller.text.isEmpty ? notes[index] : searchedfornote[index],
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
  void
      initState() {
    BlocProvider.of<NotesCubit>(context).FitchAllData();
    CheckStateOfUserToevloper();
    super.initState();
  }

  void
      CheckStateOfUserToevloper() {
    FirebaseAuth.instance.authStateChanges().listen((User?
        user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  @override
  Widget
      build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        // Set this height
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: false,
          leading: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/IMG_2039.JPG'),
            ),
          ),
          title: widget.username != null
              ? Text(
                  'Hi,${widget.username}',
                  style: const TextStyle(
                    fontFamily: 'Lato',
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                  ),
                )
              : const Text(
                  'Hi,User',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                  ),
                ),
          actions: [
            CustomPopUpMenu(
              onTapItem1: () {
                standerDialog(context: context, title: 'Contact Us In Email', desc: 'Email : shadysteha571@gmail.com');
              },
              onTapItem2: () {
                GoogleSignIn googleSignIn = GoogleSignIn();
                googleSignIn.disconnect();

                FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(context, kHomeView, (route) => false);
              },
            )
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomRight, colors: [
          Colors.white,
          Colors.grey.withOpacity(0.66),
          const Color.fromARGB(255, 71, 41, 41).withOpacity(0.77),
        ])),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(children: [
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
        backgroundColor: const Color.fromARGB(255, 71, 29, 29).withOpacity(0.80),
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(34), topRight: Radius.circular(34))),
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
