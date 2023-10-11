import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

// ignore: constant_identifier_names
const Color KprimeColor = Color.fromARGB(255, 50, 23, 20);
const kNoteBox = 'NotesBox';

const kLoginView = 'LoginView';
const kRegisterView = 'RegisterView';
const kNoteView = 'NoteView';
const kHomeView = 'HomeView';

List<Color> colors = const [
  Color(0xff415a77),
  Color(0xff22577a),
  Color.fromARGB(255, 119, 147, 179),
  Color(0xff540b0e),
  Color(0xffe26d5c),
  Color(0xff0c1821),
  Color(0xff373d20),
  Color(0xff1b4332),
  Color(0xff967aa1),
  Color(0xfff08080),
  Color(0xff90e0ef),
  Color(0xfff1faee),
  Color(0xffffd6ff),
  Color(0xff84a98c),
  Color(0xff354f52),
  Color(0xff353535),
  Color(0xfff08080),
  Color(0xfffbc4ab),
  Color(0xff432818),
  Color(0xff003f88),
  Color(0xff800f2f),
  Color(0xff006d77),
  Color(0xffe07a5f),
  Color(0xffb0c4b1),
  Color(0xffb1a7a6),
  Color(0xff5f0f40),
  Color(0xffff595e),
  Color(0xff22211f),
];

class CustomSpace extends StatelessWidget {
  const CustomSpace({
    super.key,
    required this.Number,
  });
  final int Number;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / Number,
    );
  }
}

void standerDialog(
    {required BuildContext context,
    required String? title,
    required String? desc}) {
  AwesomeDialog(
    customHeader: Image.asset(
      'assets/images/Design inspiration-pana.png',
      width: 100,
      height: 100,
    ),
    btnOkColor: KprimeColor,
    btnCancelColor: KprimeColor,
    context: context,
    animType: AnimType.rightSlide,
    title: title,
    desc: desc,
  ).show();
}
