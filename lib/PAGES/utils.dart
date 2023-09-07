import 'package:flutter/material.dart';

class Utils{
  final messengerKey = GlobalKey<ScaffoldMessengerState>();
    showSnackBar(String ? text)
  {
    if (text==null) return;
     
    final snackBaar = SnackBar(content: Text(text),backgroundColor: Colors.red,);
    messengerKey.currentState!
       .. removeCurrentSnackBar()
       ..showSnackBar(snackBaar);

  }
}