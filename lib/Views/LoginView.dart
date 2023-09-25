import 'package:flutter/material.dart';
import 'package:notely/Views/CustomWigets/CutomBottom.dart';
import 'package:notely/Views/RegisterView.dart';
import 'package:notely/constans.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 15,
                    ),
                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(70),
                            color: const Color.fromARGB(255, 208, 207, 207)),
                        child: Image.asset(
                          'assets/images/Design inspiration-pana.png',
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 80,
                    ),
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 29,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 300,
                    ),
                    Text(
                      'Login to continue Using this App',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    const Text(
                      'Email ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    TextFormField(
                      cursorColor: Colors.black26,
                      onTapOutside: (Event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 204, 198, 198)
                            .withOpacity(0.60),
                        filled: true,
                        hintText: 'Add your Email ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 234, 226, 226),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 241, 236, 236),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 131, 128, 128),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 200,
                    ),
                    const Text(
                      'Password ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    TextFormField(
                      onTapOutside: (Event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 204, 198, 198)
                            .withOpacity(0.60),
                        filled: true,
                        hintText: 'Add your password ',
                        suffixIcon: const Icon(Icons.visibility),
                        suffixIconColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.focused)
                                ? const Color.fromARGB(255, 99, 96, 96)
                                : const Color.fromARGB(255, 94, 92, 92)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 234, 226, 226),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 241, 236, 236),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 131, 128, 128),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 200,
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 60,
                    ),
                    CustomBottom(
                      width: double.infinity,
                      backgroundColor: const Color.fromARGB(255, 202, 196, 196)
                          .withOpacity(0.66),
                      title: 'Login',
                      onPressed: () {},
                      icon: Icons.arrow_forward,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 80,
                    ),
                    CustomBottom(
                      width: double.infinity,
                      backgroundColor: const Color.fromARGB(255, 202, 196, 196)
                          .withOpacity(0.66),
                      title: 'Login with Google',
                      onPressed: () {},
                      icon: Icons.arrow_forward,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 80,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Dont\'t have Acount ?',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        SizedBox(
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
                              return RegisterView();
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
    );
  }
}
