// ignore_for_file: use_build_context_synchronously

import 'package:class_11/Screen/Auth/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../Home/home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Log In',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'Please enter your email.',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Please enter your password.',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  if (emailController.text != '' && passwordController.text != '') {
                    if (emailController.text.contains('@') && emailController.text.contains('.com')) {
                      try {
                        var auth = FirebaseAuth.instance;

                        UserCredential user = await auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);

                        if (user.user != null) {
                          EasyLoading.showSuccess('Successfully Login');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ));
                        } else {
                          EasyLoading.showError('Something is wrong');
                        }
                      } on FirebaseAuthException catch (e) {
                        EasyLoading.showError(e.code);
                      } catch (e) {
                        EasyLoading.showError(e.toString());
                      }
                    }
                  } else {
                    EasyLoading.showError('Enter email & password');
                  }
                },
                child: const Text('LogIn')),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ));
                },
                child: const Text('Sign Up')),
          ],
        ),
      ),
    );
  }
}
