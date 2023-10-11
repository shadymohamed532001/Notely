import 'package:flutter/material.dart';
import 'package:notely/Features/auth/Views/widgets/CutomBottom.dart';

class HomeView
    extends StatelessWidget {
  const HomeView(
      {super.key});

  @override
  Widget
      build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomRight, colors: [
            Colors.white,
            Color.fromARGB(255, 50, 23, 20),
          ]),
        ),
        child: Column(
          children: [
            const Spacer(
              flex: 6,
            ),
            Image.asset(
              'assets/images/Design inspiration-pana.png',
              height: 300,
              width: 300,
            ),
            const Spacer(
              flex: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Capture What\'s you on your mind & get a reminder later at the reigr place or time you can also in the future add voice to your and other features',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.50),
                  fontSize: 21,
                ),
              ),
            ),
            const Spacer(
              flex: 4,
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 25,
                // bottom: 55,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomBottom(
                    icon: const Icon(
                      Icons.arrow_forward,
                      size: 28,
                    ),
                    number: 1.8,
                    text: 'Lets start',
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      wordSpacing: 4.3,
                    ),
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(context, 'LoginView', (route) => false);
                    },
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 3,
            )
          ],
        ),
      ),
    );
  }
}
