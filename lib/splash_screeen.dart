import 'dart:async';
import 'package:second_ui/homepage.dart';
import 'package:flutter/material.dart';

class SplashScreeen extends StatefulWidget {
  const SplashScreeen({super.key});

  @override
  State<SplashScreeen> createState() => _SplashScreeenState();
}

class _SplashScreeenState extends State<SplashScreeen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.red,
        child: Column(
          children: [
            // Centered Column content
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage("assets/logo_drawer.icon.png"),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'SARAKARI RESULT',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            // Positioned at the end
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                "Welcome to No.1 Educational Portal",
                style: TextStyle(
                    color: Colors.white,fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
