import 'package:flutter/material.dart';
import 'package:papayamshopdemo/pages/dashboard.dart';
import 'package:papayamshopdemo/pages/splash_screen.dart';

var globalMassagerKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: Future.delayed(const Duration(seconds: 5)),
      builder: (context, snapshoot){
     if(snapshoot.connectionState == ConnectionState.waiting){
      return const SplashScreen();
     }else{
      return const DashboardPage();
     }
    }
    );
  }
}
