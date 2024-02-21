import 'package:flutter/material.dart';
import 'package:music/models/auth.dart';
import 'package:music/ui/screens/auth/login.dart';

import '../../../service/auth.dart';
import '../../widget/button.dart';
import '../../widget/text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _showPass = false;
  bool _showConfirm = false;

  void _togglePasswordVisibility() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _showConfirm = !_showConfirm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Account"),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 19, 18, 18),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                MyTextField(
                  controller: _nameController,
                  hintText: "Name",
                ),
                const SizedBox(height: 12),
                MyTextField(
                  controller: _emailController,
                  hintText: "Email",
                ),
                const SizedBox(height: 12),
                MyTextField(
                  controller: _passwordController,
                  hintText: "Password",
                  obscureText: !_showPass,
                  onPressed: _togglePasswordVisibility,
                  icon: _showPass ? Icons.visibility_off : Icons.visibility,
                ),
                const SizedBox(height: 12),
                MyTextField(
                  hintText: "Confirm password",
                  obscureText: !_showConfirm,
                  onPressed: _toggleConfirmPasswordVisibility,
                  icon: _showConfirm ? Icons.visibility_off : Icons.visibility,
                ),
                const SizedBox(height: 30),
                MyButton(
                  customColor: const Color.fromARGB(255, 10, 185, 121),
                  text: "Sign up",
                  onTap: () {
                    // Perform registration
                    AuthModel auth = AuthModel(
                      name: _nameController.text.trim(),
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim(),
                      context: context,
                      setLoading: (bool value) {
                        setState(() {});
                      },
                    );
                    Auth.registerWithEmailAndPassword(auth);
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  "Or sign up with",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade700),
                      ),
                      child: Image.asset("assets/facebook.png", width: 50),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade700),
                      ),
                      child: Image.asset("assets/google.png", width: 50),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade700),
                      ),
                      child: Icon(
                        Icons.apple,
                        size: 50,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account ?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Login()),
                        );
                      },
                      child: const Text(
                        "LOG IN",
                        style: TextStyle(
                          color: Color.fromARGB(255, 10, 185, 121),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
