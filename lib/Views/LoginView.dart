// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.white,
                KprimeColor,
              ],
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
                        }
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
                        }
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
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            final Credential = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: emailcontroller.text,
                              password: passwordcontroller.text,
                            );
                            if (Credential.user!.emailVerified) {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, 'NoteView', (route) => false);
                            } else {
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
                                title: 'Email Not Verified',
                                desc:
                                    'please check your Email to Verfide .............',
                              ).show();
                              FirebaseAuth.instance.currentUser!
                                  .sendEmailVerification();
                            }
                            // Successful login
                            print('Login successful');
                          } on FirebaseAuthException catch (e) {
                            print(e.code);
                            print(
                                '================================================================');
                            if (e.code == "INVALID_LOGIN_CREDENTIALS") {
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
                                title: 'Wrong Email Or Password',
                                desc:
                                    'please check your Email or Password .............',
                              ).show();
                            }
                          } catch (e) {
                            // Other exceptions
                            print(e);
                          }
                        }
                      },

                      // onTap: () async {
                      //   if (formKey.currentState!.validate()) {
                      //     try {
                      //       await FirebaseAuth.instance
                      //           .signInWithEmailAndPassword(
                      //         email: emailcontroller.text,
                      //         password: passwordcontroller.text,
                      //       );

                      //       Navigator.pushNamedAndRemoveUntil(
                      //           context, 'NoteView', (route) => false);
                      //     } on FirebaseAuthException catch (e) {
                      //       if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
                      //         AwesomeDialog(
                      //           customHeader: Image.asset(
                      //             'assets/images/Design inspiration-pana.png',
                      //             width: 100,
                      //             height: 100,
                      //           ),
                      //           btnOkColor: KprimeColor,
                      //           btnCancelColor: KprimeColor,
                      //           context: context,
                      //           animType: AnimType.rightSlide,
                      //           title: 'weak-password',
                      //           desc:
                      //               'please check your password .............',
                      //         ).show();
                      //       } else if (e.code == 'wrong-password') {
                      //         AwesomeDialog(
                      //           customHeader: Image.asset(
                      //             'assets/images/Design inspiration-pana.png',
                      //             width: 100,
                      //             height: 100,
                      //           ),
                      //           btnOkColor: KprimeColor,
                      //           btnCancelColor: KprimeColor,
                      //           context: context,
                      //           animType: AnimType.rightSlide,
                      //           title: 'email already in use',
                      //           desc: 'please check your email .............',
                      //         ).show();
                      //       }
                      //     } catch (e) {
                      //       // print(e);
                      //     }
                      //   } else {
                      //     autovalidateMode = AutovalidateMode.always;
                      //     setState(() {});
                      //   }
                      // },
                      text: 'Login',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                      icon: const Icon(
                        Icons.arrow_forward,
                      ),
                      number: 1,
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
                      onTap: () async {},
                      text: 'Login With Google',
                      style: const TextStyle(
                        fontSize: 22,
                      ),
                      icon: const Icon(
                        Icons.arrow_forward,
                      ),
                      number: 1,
                    ),
                    const CustomSpace(
                      Number: 80,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Dont\'t have an Acount',
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
                          onPressed: () {
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
          ),
        ),
      ),
    );
  }
}
