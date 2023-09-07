import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:email_validator/email_validator.dart';

// ignore: camel_case_types, must_be_immutable
class sign_in_page extends StatelessWidget {
  sign_in_page({Key? key, required this.onClickedSignIn}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  final Function() onClickedSignIn;

  final nameController = TextEditingController();
  // TextEditingController gmailController = new TextEditingController();
  final passwordController = TextEditingController();
  final email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var widget = sign_in_page(onClickedSignIn: onClickedSignIn);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("SVG IMAGE/VBKC0X.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 88),
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
              padding: EdgeInsets.only(top: 188),
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: 28,
                  width: 280,
                  child: Text(
                    "Welcome to Vii Music",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.cyanAccent, fontSize: 24),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 230),
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: 35,
                  width: 268,
                  child: Text(
                    "Create your account",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              // physics: const ScrollPhysics(),
              physics: const BouncingScrollPhysics(),

              // scrollDirection: Axis.vertical,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 288, right: 20),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          height: 22,
                          width: 300,
                          child: Text(
                            "Name",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 48,
                          width: 320,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(7.0),
                            ),
                          ),
                          child: TextField(
                            style: const TextStyle(fontSize: 20),
                            controller: nameController,
                            // obscureText: true,
                            textInputAction: TextInputAction.next,
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
                            "Email",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 48,
                          width: 320,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(7.0),
                            ),
                          ),
                          child: TextFormField(
                            controller: email,
                            style: const TextStyle(fontSize: 20),

                            // obscureText: true,
                            textInputAction: TextInputAction.next,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (email) =>
                                email != null && !EmailValidator.validate(email)
                                    ? "Enter a valid email"
                                    : null,
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
                      padding: const EdgeInsets.only(top: 4),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 48,
                          width: 320,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(7.0),
                            ),
                          ),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            style: const TextStyle(fontSize: 20),

                            // obscureText: true,
                            textInputAction: TextInputAction.next,

                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) =>
                                value != null && value.length < 6
                                    ? "Enter min. 6 characters"
                                    : null,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 28),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.cyanAccent,
                            minimumSize: const Size(320, 40),
                            // textStyle: TextStyle(fontSize: 14)
                          ),
                          child: const Text(
                            "Sing Up",
                            style: TextStyle(fontSize: 14),
                          ),
                          onPressed: signUp,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 12),
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
                      padding: const EdgeInsets.only(top: 4),
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
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
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
                      padding: const EdgeInsets.only(top: 20),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          height: 40,
                          width: 300,
                          // decoration: BoxDecoration(color: Colors.white),
                          child: Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                    text: "Already have an account? ",
                                    children: [
                                      TextSpan(
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = widget.onClickedSignIn,
                                          text: "Log In",
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
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
          ],
        ),
      ),
    );
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e);
      // Utils.showSnackBar(e.message);
    }
  }
}
