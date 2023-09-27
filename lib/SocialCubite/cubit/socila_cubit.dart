import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'socila_state.dart';

class SocilaCubit extends Cubit<SocilaState> {
  SocilaCubit() : super(SocilaInitial());

  Future createAcount({required String email, required String password}) async {
    try {
      emit(CreateAcountLoading());

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(CreateAcountSucsess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(CreateAcountFalieur(ErroeMassage: e.toString()));
      } else if (e.code == 'wrong-password') {
        emit(CreateAcountFalieur(ErroeMassage: e.toString()));
      }
    }
  }

  Future signInAcount({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SignInAcountSucsess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignInAcountFalieur(ErroeMassage: e.toString()));
      } else if (e.code == 'wrong-password') {
        emit(SignInAcountFalieur(ErroeMassage: e.toString()));
      }
    }
  }
}
