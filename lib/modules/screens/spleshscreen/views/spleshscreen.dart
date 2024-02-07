import 'dart:async';

import 'package:flutter/material.dart';

class Splesh_screen extends StatelessWidget {
  const Splesh_screen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushNamed(context, 'introo');
    });
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Transform.rotate(
              angle: 0,
              child: Container(
                height: 400,
                width: 400,
                padding: const EdgeInsets.all(
                  8.0,
                ),
                child: Image.asset(
                  'assets/Outer space.gif',
                ),
              ),
            ),
            // child: Container(
            //   height: 300,
            //   width: 300,
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage(
            //         'assets/Planet-1.png',
            //       ),
            //     ),
            //   ),
            // ),
          )
        ],
      ),
    );
  }
}
