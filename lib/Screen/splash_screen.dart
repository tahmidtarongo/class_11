// ignore_for_file: use_build_context_synchronously

import 'package:class_11/Screen/Auth/sign_in_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nextPage();
  }

  void nextPage()async{
   await Future.delayed(const Duration(seconds: 3));
   Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInScreen(),));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      body: const Center(
        child: Text('Splash Screen', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
