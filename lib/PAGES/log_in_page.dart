import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../main.dart';

// ignore: camel_case_types
class log_in_page extends StatefulWidget {
  const log_in_page({Key? key, required this.onClickedSignUp})
      : super(key: key);

  final VoidCallback onClickedSignUp;

  @override
  State<log_in_page> createState() => _log_in_pageState();
}

// ignore: camel_case_types
class _log_in_pageState extends State<log_in_page> {
 final  emailController =  TextEditingController();
 final  passController =  TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("SVG IMAGE/VBKC0X.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 75,
                    width: 75,
                    decoration: const BoxDecoration(
                      color: Colors.cyanAccent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        "SVG IMAGE/noun-music-4300704.svg",
                        color: Colors.white,
                        height: 60,
                        width: 60,
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: 28,
                    width: 280,
                    child: Text(
                      "Music Player",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.cyanAccent, fontSize: 24),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 14),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: 35,
                    width: 400,
                    child: Text(
                      "Sign in to your account",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 50, right: 20),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: 22,
                    width: 300,
                    child: Text(
                      "Email address",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 40,
                    width: 320,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(7.0),
                      ),
                    ),
                    child: TextField(
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                      controller: emailController,
                      // obscureText: true,
                      textAlign: TextAlign.left,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        // hintText: '   vikashini',
                        // hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, right: 20),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: 22,
                    width: 300,
                    child: Text(
                      "Password",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 40,
                    width: 320,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(7.0),
                      ),
                    ),
                    child: TextField(
                      style: const TextStyle(fontSize: 20),
                      controller: passController,
                      // obscureText: true,
                      textAlign: TextAlign.left,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        // hintText: '   vikashini',
                        // hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    // decoration: BoxDecoration(color: Colors.white),
                    height: 30,
                    width: 320,
                    child: Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            setState(() => isChecked = value!);
                          },
                          activeColor: Colors.white,
                          checkColor: Colors.black,
                        ),
                        const Text(
                          "Remember me",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        GestureDetector(
                          child: Text(
                            "     Forgot your password?",
                            style: TextStyle(
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          // onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ForgotPasswordPage())),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.cyanAccent,
                      minimumSize: const Size(320, 40),
                      // textStyle: TextStyle(fontSize: 14)
                    ),
                    child: const Text(
                      "Sing in",
                      style: TextStyle(fontSize: 14),
                    ),
                    onPressed: signIn,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: 16,
                    width: 320,
                    // decoration: const BoxDecoration(
                    //   color: Colors.white,
                    // ),
                    child: Text(
                      "Or continue with",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: const Size(320, 40),
                    ),
                    child: SizedBox(
                      height: 40,
                      width: 288,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: SvgPicture.asset(
                              "SVG IMAGE/google-color-icon.svg",
                              width: 24,
                              height: 25,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 6),
                            child: Text(
                              "Sign in with Google",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    // decoration: BoxDecoration(color: Colors.white),
                    height: 40,
                    width: 338,
                    child: Row(
                      children: [
                        RichText(
                          text: TextSpan(
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                              text: "If you don't have any account",
                              children: [
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = widget.onClickedSignUp,
                                    text: "  Sign Up",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ))
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}

// ignore: camel_case_types

