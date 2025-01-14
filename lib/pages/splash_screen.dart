import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              Container(
                color: const Color(0xFFF5EFD7),
              ),
              const Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                      width: 400,
                      height: 400,
                      image: AssetImage('assets/images/MainPapayam.png')),
                  Text("Project Aplikasi",
                      style: TextStyle(
                        color: Color(0XFF968B7B),
                        fontSize: 32,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ))
                ],
              ))
            ],
          ),
        ));
  }
}
