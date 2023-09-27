import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notely/BlocObserver.dart';
import 'package:notely/Models/NoteModel.dart';
import 'package:notely/NotesCubite/cubit/notes_cubit.dart';
import 'package:notely/SocialCubite/cubit/socila_cubit.dart';
import 'package:notely/Views/LoginView.dart';
import 'package:notely/Views/RegisterView.dart';
import 'package:notely/Views/homeview.dart';
import 'package:notely/Views/notesviews.dart';
import 'package:notely/constans.dart';
import 'package:notely/firebase_options.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());

  await Hive.openBox<NoteModel>(kNoteBox);
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NotesCubit()),
        BlocProvider(create: (context) => SocilaCubit()),
      ],
      child: MaterialApp(
        routes: {
          'LoginView': (context) => const LoginView(),
          'RegisterView': (context) => const RegisterView(),
          'NoteView': (context) => const NotesViews(),
          'HomeView': (context) => const HomeView()
        },
        theme: ThemeData(
          // brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        debugShowCheckedModeBanner: false,
        home: (FirebaseAuth.instance.currentUser != null &&
                FirebaseAuth.instance.currentUser!.emailVerified)
            ? const HomeView()
            : const LoginView(),
      ),
    );
  }
}
