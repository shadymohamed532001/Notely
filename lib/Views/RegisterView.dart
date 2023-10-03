// ignore_for_file: use_build_context_synchronously, duplicate_ignore

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notely/Views/CustomWigets/CustomLogo.dart';
import 'package:notely/Views/CustomWigets/CustomTextFormFiled.dart';
import 'package:notely/Views/CustomWigets/CutomBottom.dart';
import 'package:notely/Helper/constans.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();

  TextEditingController namecontroller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
  bool isPasswordShow = true;
  bool isconfirmPasswordShow = true;
  String _errorEmailMessage = '';
  // String _errorPasswordMessage = '';

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
                        Number: 20,
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
                        onChanged: (value) {
                          validateEmail(value);
                        },
                        filled: true,
                        controller: emailcontroller,
                        fillColor: const Color.fromRGBO(190, 183, 183, 1),
                        hintText: 'Add Your Email',
                      ),
                      SizedBox(
                        height: 16,
                        width: double.infinity,
                        child: Text(_errorEmailMessage,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 199, 42, 30),
                            )),
                      ),
                      // const CustomSpace(Number: 900),
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
                            return 'Please enter your password';
                          } else if (value.length > 8) {
                            return 'Password must be at least 8 characters';
                          }
                          return null;
                        },
                        // onChanged: (value) {
                        //   validatePassword(value);
                        // },
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isPasswordShow = !isPasswordShow;
                            });
                          },
                          icon: isPasswordShow
                              ? const Icon((Icons.visibility_off))
                              : const Icon(Icons.visibility),
                        ),
                        obscureText: isPasswordShow,
                        controller: passwordcontroller,
                        filled: true,
                        fillColor: const Color.fromRGBO(190, 183, 183, 1),
                        hintText: 'Add Your Password',
                      ),
                      const CustomSpace(
                        Number: 200,
                      ),
                      const Text(
                        'confirm password',
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
                            return 'Please enter your password';
                          } else if (value.length > 8) {
                            return 'Password must be at least 8 characters';
                          } else if (value != passwordcontroller.text) {
                            return 'passwords not match';
                          }
                          return null;
                        },
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isconfirmPasswordShow = !isconfirmPasswordShow;
                            });
                          },
                          icon: isconfirmPasswordShow
                              ? const Icon((Icons.visibility_off))
                              : const Icon(Icons.visibility),
                        ),
                        obscureText: isconfirmPasswordShow,
                        controller: confirmpasswordcontroller,
                        filled: true,
                        fillColor: const Color.fromRGBO(190, 183, 183, 1),
                        hintText: 'Add Your confirm password',
                      ),
                      // SizedBox(
                      //   height: 16,
                      //   width: double.infinity,
                      //   child: Text(_errorPasswordMessage,
                      //       style: TextStyle(
                      //         color: const Color.fromARGB(255, 199, 42, 30),
                      //       )),
                      // ),
                      const CustomSpace(
                        Number: 30,
                      ),
                      CustomBottom(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            await RegisterUser(context);
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
                              Navigator.pushNamedAndRemoveUntil(
                                  context, kLoginView, (route) => false);
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

  Future<void> RegisterUser(BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text,
        password: passwordcontroller.text,
      );
      FirebaseAuth.instance.currentUser!.sendEmailVerification();
      Navigator.pushNamedAndRemoveUntil(
        context,
        kLoginView,
        (route) => false,
      );
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
          desc: 'please check your password .............',
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
    }
  }

  void validateEmail(String val) {
    if (!EmailValidator.validate(val, true) && val.isNotEmpty) {
      setState(() {
        _errorEmailMessage = "Invalid Email Address";
      });
    } else {
      setState(() {
        _errorEmailMessage = "";
      });
    }
  }

  // void validatePassword(String value) {
  //   if (value == passwordcontroller.text) {
  //     setState(() {
  //       _errorPasswordMessage = "";
  //     });
  //   } else {
  //     setState(() {
  //       _errorPasswordMessage = "the Confirm Password dos not match";
  //     });
  //   }
  // }
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