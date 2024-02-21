import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music/models/auth.dart';

import '../ui/screens/home/home.dart';

class Auth {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> signInWithEmailAndPassword(AuthModel auth) async {
    try {
      auth.setLoading(true);
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
              email: auth.email, password: auth.password);
      if (userCredential.user != null) {
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          auth.context,
          MaterialPageRoute(
              builder: (context) =>
                  const HomeScreen()), // Replace HomeScreen() with your home screen widget
        );
      }
    } catch (e) {
      print("Sign in failed: $e");

      showDialog(
          // ignore: use_build_context_synchronously
          context: auth.context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Sign In Failed"),
              content: Text("Error: $e"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop;
                    },
                    child: const Text("Oke"))
              ],
            );
          });
    } finally {
      auth.setLoading(false);
    }
  }

  static Future<void> registerWithEmailAndPassword(AuthModel auth) async {
    try {
      auth.setLoading(true);
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: auth.email,
        password: auth.password,
      );
      if (userCredential.user != null) {
        // Registration successful, optionally perform any action needed
        // For example, navigate to home screen
        Navigator.pushReplacement(
          auth.context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    } catch (e) {
      print("Registration failed: $e");

      showDialog(
        // ignore: use_build_context_synchronously
        context: auth.context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Registration Failed"),
            content: Text("Error: $e"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              )
            ],
          );
        },
      );
    } finally {
      auth.setLoading(false);
    }
  }

  Future<void> resetPassword(String email, BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: const Text("Password Reset Email Sent "),
                content: const Text(
                    "Check your email for instructions to reset your password."),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Ok"))
                ]);
          });
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: const Text("Error"),
                content: Text("Failed to send password reset email: $e"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Ok"))
                ]);
          });
    }
  }
}
