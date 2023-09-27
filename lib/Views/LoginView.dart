// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notely/Views/CustomWigets/CustomLogo.dart';
import 'package:notely/Views/CustomWigets/CustomTextFormFiled.dart';
import 'package:notely/Views/CustomWigets/CutomBottom.dart';
import 'package:notely/Views/RegisterView.dart';
import 'package:notely/constans.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.white, KprimeColor],
              ),
            ),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomSpace(
                        Number: 15,
                      ),
                      const CustomLogo(),
                      const CustomSpace(
                        Number: 80,
                      ),
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const CustomSpace(
                        Number: 300,
                      ),
                      Text(
                        'Login to continue Using this App',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                      const CustomSpace(
                        Number: 50,
                      ),
                      const CustomSpace(
                        Number: 200,
                      ),
                      const Text(
                        'Email ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      CustomTextFormFiled(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Failed is required';
                          } else
                            return null;
                        },
                        filled: true,
                        controller: emailcontroller,
                        fillColor: const Color.fromRGBO(190, 183, 183, 1),
                        hintText: 'Add Your Email',
                      ),
                      const CustomSpace(Number: 200),
                      const Text(
                        'Password ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const CustomSpace(
                        Number: 400,
                      ),
                      CustomTextFormFiled(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Failed is required';
                          } else
                            return null;
                        },
                        controller: passwordcontroller,
                        filled: true,
                        fillColor: const Color.fromRGBO(190, 183, 183, 1),
                        hintText: 'Add Your Password',
                      ),
                      const CustomSpace(
                        Number: 200,
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: const Text(
                          'Forget password ? ',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                      const CustomSpace(
                        Number: 70,
                      ),
                      CustomBottom(
                        width: double.infinity,
                        backgroundColor:
                            const Color.fromARGB(255, 202, 196, 196)
                                .withOpacity(0.66),
                        title: 'Login in',
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            try {
                              await LoginUser();
                              Navigator.pushNamedAndRemoveUntil(
                                  context, 'NotesView', (route) => false);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                ShowSnackBar(
                                    context, 'No user found for that email.');
                              } else if (e.code == 'wrong-password') {
                                ShowSnackBar(context,
                                    'Wrong password provided for that user.');
                              }
                            } catch (e) {
                              print(e);
                            }
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                        },
                        icon: Icons.arrow_forward,
                      ),
                      const CustomSpace(
                        Number: 100,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Or Login with ',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      const CustomSpace(
                        Number: 80,
                      ),
                      CustomBottom(
                        width: double.infinity,
                        backgroundColor:
                            const Color.fromARGB(255, 202, 196, 196)
                                .withOpacity(0.66),
                        title: 'Login with Google',
                        onPressed: () {},
                        icon: Icons.arrow_forward,
                      ),
                      const CustomSpace(
                        Number: 80,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'have an Acount',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          MaterialButton(
                            color: const Color.fromARGB(255, 170, 164, 164),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            onPressed: () async {
                              Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(builder: (context) {
                                return const RegisterView();
                              }), (route) => false);
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(color: Colors.black),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Future<void> LoginUser() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text, password: passwordcontroller.text);
  }
}

void ShowSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.redAccent,
        ),
        child: Text(message),
      ),
    ),
  );
}
