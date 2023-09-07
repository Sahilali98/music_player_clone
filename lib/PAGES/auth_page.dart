import 'package:flutter/material.dart';
import 'package:music_player/PAGES/log_in_page.dart';
import 'package:music_player/PAGES/sign_in_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? log_in_page(
          onClickedSignUp: toggle,
        )
      : sign_in_page(onClickedSignIn: toggle);

  void toggle() =>setState(()=>isLogin =! isLogin);    
}
