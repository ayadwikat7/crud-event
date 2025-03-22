import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_8/core/Widget/customTextFiled.dart';

class Registrpage extends StatelessWidget {
  Registrpage({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.purpleAccent,
                      child: Icon(Icons.person, size: 50, color: Colors.white),
                    ),
                    const SizedBox(height: 30),
                    CustomTextField(
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "Please Enter Name";
                        }
                        return null;
                      },
                      controller: nameController,
                      hintText: "Name",
                      suffixIcon: const Icon(Icons.email),
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "Please Enter Email";
                        }
                        return null;
                      },
                      controller: emailController,
                      hintText: "Email",
                      suffixIcon: const Icon(Icons.email),
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "Please Enter Password";
                        }
                        if (text.length < 6) {
                          return "Password should be at least 6 characters";
                        }
                        if (text != rePasswordController.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                      controller: passwordController,
                      hintText: "Password",
                      suffixIcon: const Icon(Icons.visibility_off),
                      obscureText: true,
                      textInputType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      controller: rePasswordController,
                      hintText: "Re-Password",
                      suffixIcon: const Icon(Icons.visibility_off),
                      obscureText: true,
                    ),
                    const SizedBox(height: 5),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forget Password?",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => registr(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          "Register",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void registr() async {
    if (_formKey.currentState!.validate()) {
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text,
        );
        print("User created: ${credential.user?.email}");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
