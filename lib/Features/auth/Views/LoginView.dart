// ignore_for_file: use_build_context_synchronously

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notely/Core/widgets/CustomSpacer.dart';
import 'package:notely/Features/auth/Views/widgets/CustomBottomNavigation.dart';
import 'package:notely/Features/auth/Views/widgets/CustomLoading.dart';
import 'package:notely/Features/auth/Views/widgets/CustomLogo.dart';
import 'package:notely/Core/widgets/CustomTextFormFiled.dart';
import 'package:notely/Features/auth/Views/widgets/CutomBottom.dart';
import 'package:notely/Core/constans.dart';
import 'package:notely/Features/Home/Views/notesviews.dart';

class LoginView
    extends StatefulWidget {
  const LoginView(
      {super.key,
      this.name});
  final String?
      name;

  @override
  State<LoginView> createState() =>
      _LoginViewState();
}

class _LoginViewState
    extends State<LoginView> {
  TextEditingController
      emailcontroller =
      TextEditingController();
  TextEditingController
      passwordcontroller =
      TextEditingController();

  final GlobalKey<FormState>
      _formKey =
      GlobalKey();
  AutovalidateMode?
      autovalidateMode =
      AutovalidateMode.disabled;
  bool
      isPasswordShow =
      true;
  String
      _errorMessage =
      '';
  bool
      isLoading =
      false;
  @override
  void
      dispose() {
    // TODO: implement dispose
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget
      build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
        child: isLoading
            ? const CustomLoading()
            : Container(
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
                              if (value == null || value.isEmpty) {
                                return 'please enter your email ';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              validateEmail(value);
                            },
                            obscureText: false,
                            filled: true,
                            controller: emailcontroller,
                            fillColor: const Color.fromRGBO(190, 183, 183, 1),
                            hintText: 'Add Your Email',
                          ),
                          SizedBox(
                            height: 16,
                            width: double.infinity,
                            child: Text(
                              _errorMessage,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 199, 42, 30),
                              ),
                            ),
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
                                return 'please enter your password';
                              } else {
                                return null;
                              }
                            },
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isPasswordShow = !isPasswordShow;
                                });
                              },
                              icon: isPasswordShow ? const Icon((Icons.visibility_off)) : const Icon(Icons.visibility),
                            ),
                            obscureText: isPasswordShow,
                            keyboardType: TextInputType.visiblePassword,
                            controller: passwordcontroller,
                            filled: true,
                            fillColor: const Color.fromRGBO(190, 183, 183, 1),
                            hintText: 'Add Your Password',
                          ),
                          const CustomSpace(
                            Number: 200,
                          ),
                          InkWell(
                            onTap: () async {
                              if (emailcontroller.text == "") {
                                standerDialog(
                                  context: context,
                                  title: 'Your email is empty',
                                  desc: 'pelase enter your email to reset your psasword',
                                );
                              } else {
                                standerDialog(
                                  context: context,
                                  title: 'Reset Password',
                                  desc: 'please check your email to reset your password',
                                );
                                await FirebaseAuth.instance.sendPasswordResetEmail(email: emailcontroller.text);
                              }
                            },
                            child: Container(
                              alignment: Alignment.bottomRight,
                              child: const Text(
                                'Forget password ? ',
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                          const CustomSpace(
                            Number: 70,
                          ),
                          CustomBottom(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });
                                await LoginUser(context);
                                setState(() {
                                  isLoading = false;
                                });
                              } else {
                                autovalidateMode = AutovalidateMode.always;
                                setState(() {});
                              }
                            },
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
                            onTap: () async {
                              // await signInWithGoogle();
                            },
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
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Dont\'t have an Acount',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CustomBottomNavigation()
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

  Future<void>
      LoginUser(BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text,
        password: passwordcontroller.text,
      );
      if (credential.user!.emailVerified) {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
          return NotesViews(
            username: widget.name,
          );
        }), (route) => false);
      } else {
        standerDialog(
          context: context,
          title: 'Email Not Verified',
          desc: 'please check your Email to Verfide ............',
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "INVALID_LOGIN_CREDENTIALS") {
        standerDialog(context: context, title: 'Wrong Email Or Password', desc: 'please check your Email or Password .............');
      }
    }
  }

  void validateEmail(
      String val) {
    if (!EmailValidator.validate(val, true) &&
        val.isNotEmpty) {
      setState(() {
        _errorMessage = "Invalid Email Address";
      });
    } else {
      setState(() {
        _errorMessage = "";
      });
    }
  }
}
