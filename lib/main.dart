import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notely/Core/BlocObserver.dart';
import 'package:notely/Models/NoteModel.dart';
import 'package:notely/NotesCubite/cubit/notes_cubit.dart';
import 'package:notely/Features/auth/Views/LoginView.dart';
import 'package:notely/Features/auth/Views/RegisterView.dart';
import 'package:notely/Features/entro/Views/entor.dart';
import 'package:notely/Features/Home/Views/notesviews.dart';
import 'package:notely/Core/constans.dart';
import 'package:notely/firebase_options.dart';

void
    main() async {
  await Hive
      .initFlutter();
  Hive.registerAdapter(
      NoteModelAdapter());

  await Hive.openBox<NoteModel>(
      kNoteBox);
  Bloc.observer =
      MyBlocObserver();
  WidgetsFlutterBinding
      .ensureInitialized();
  await Firebase
      .initializeApp(
    options:
        DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
      const MyApp());
}

class MyApp
    extends StatelessWidget {
  const MyApp(
      {super.key});

  // This widget is the root of your application.
  @override
  Widget
      build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NotesCubit()),
      ],
      child: MaterialApp(
        routes: {
          kLoginView: (context) => const LoginView(),
          kRegisterView: (context) => const RegisterView(),
          kNoteView: (context) => const NotesViews(),
          kHomeView: (context) => const HomeView(),
        },
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        debugShowCheckedModeBanner: false,
        home: (FirebaseAuth.instance.currentUser != null && FirebaseAuth.instance.currentUser!.emailVerified) ? const NotesViews() : const HomeView(),
      ),
    );
  }
}
