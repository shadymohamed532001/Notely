import 'package:flutter/material.dart';

class CutomHellowBar extends StatelessWidget {
  const CutomHellowBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 25,
            child: Material(
              child: Container(
                height: 180,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0.0),
                    color: const Color.fromARGB(255, 71, 21, 21),
                    gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white70,
                          Color.fromARGB(255, 56, 21, 21),
                        ]),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 4.0,
                          blurRadius: 20.0,
                          offset: const Offset(-10, 10))
                    ]),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 30,
            bottom: 40,
            child: Card(
              elevation: 10.0,
              shadowColor: Colors.grey.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                height: 200,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/Job offers-bro.png'),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              top: 30,
              left: 185,
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                width: 175,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Noteley App',
                      style: TextStyle(
                        fontSize: 21,
                        fontFamily: 'latin',
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 60, 30, 30)
                            .withOpacity(0.9),
                      ),
                    ),
                    Text(
                      'welcome to Noteley App',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      'You can edit and add your own notes',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.70),
                          fontFamily: 'latin',
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
