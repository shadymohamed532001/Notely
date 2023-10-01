// ignore_for_file: use_build_context_synchronously, duplicate_ignore

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notely/Views/CustomWigets/CustomLogo.dart';
import 'package:notely/Views/CustomWigets/CustomTextFormFiled.dart';
import 'package:notely/Views/CustomWigets/CutomBottom.dart';
import 'package:notely/constans.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
  bool isPasswordShow = true;

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
                        'Register',
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
                        'Register to continue Using this App',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                      const CustomSpace(
                        Number: 50,
                      ),
                      const Text(
                        'Name ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      CustomTextFormFiled(
                        obscureText: false,

                        // obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Failed is required';
                          } else {
                            return null;
                          }
                        },
                        controller: namecontroller,
                        filled: true,
                        fillColor: const Color.fromRGBO(190, 183, 183, 1),
                        hintText: 'Add Your Name',
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
                        obscureText: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Failed is required';
                          } else {
                            return null;
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
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isPasswordShow = !isPasswordShow;
                            });
                          },
                          icon: isPasswordShow
                              ? Icon((Icons.visibility_off))
                              : Icon(Icons.visibility),
                        ),
                        obscureText: isPasswordShow,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Failed is required';
                          }
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
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            try {
                              await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                email: emailcontroller.text,
                                password: passwordcontroller.text,
                              );
                              FirebaseAuth.instance.currentUser!
                                  .sendEmailVerification();
                              Navigator.pushNamedAndRemoveUntil(
                                  context, 'LoginView', (route) => false);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
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
                                  title: 'weak-password',
                                  desc:
                                      'please check your password .............',
                                ).show();
                              } else if (e.code == 'email-already-in-use') {
                                // ignore: use_build_context_synchronously
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
                                  title: 'email already in use',
                                  desc: 'please check your email .............',
                                ).show();
                              }
                            } catch (e) {
                              // print(e);
                            }
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                        },
                        text: 'Register',
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
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
                            onPressed: () {
                              // Navigator.pushAndRemoveUntil(context,
                              //     MaterialPageRoute(builder: (context) {
                              //   return const LoginView();
                              // }), (route) => false);
                            },
                            child: const Text(
                              'Login',
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
}

// void (BuildContext context, String message) {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: Container(
//         height: 80,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(14),
//           color: Colors.redAccent,
//         ),
//         child: Text(message),
//       ),
//     ),
//   );
// }


/* suffixIcon: const Icon(Icons.visibility),
                        suffixIconColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.focused)
                                ? const Color.fromARGB(255, 99, 96, 96)
                                : const Color.fromARGB(255, 94, 92, 92)),*/ 