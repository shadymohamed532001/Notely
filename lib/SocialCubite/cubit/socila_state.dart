part of 'socila_cubit.dart';

@immutable
sealed class SocilaState {}

final class SocilaInitial extends SocilaState {}

class CreateAcountLoading extends SocilaState {}

class CreateAcountSucsess extends SocilaState {}

class CreateAcountFalieur extends SocilaState {
  final String ErroeMassage;

  CreateAcountFalieur({required this.ErroeMassage});
}

class SignInAcountLoading extends SocilaState {}

class SignInAcountSucsess extends SocilaState {}

class SignInAcountFalieur extends SocilaState {
  final String ErroeMassage;

  SignInAcountFalieur({required this.ErroeMassage});
}
