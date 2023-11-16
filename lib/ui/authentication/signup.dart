import 'dart:convert';

import 'package:findobj/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:findobj/config/constant.dart';
import 'package:findobj/config/global_style.dart';
import 'package:findobj/ui/authentication/signin.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';


import 'package:http/http.dart' as http;

class SignupPage extends StatefulWidget {
  final bool fromList;

  const SignupPage({Key? key, this.fromList = false}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  //---------cording ---------
  //text controller 작성

  @override
  void initState() {
    super.initState();
  }



  //---------cording ---------
  Future user_insert() async {
    String _custcd = '';

    return true;
  }




  @override
  Widget build(BuildContext context) {
    //---------cording ---------
    return Scaffold(
    );
  }
   //---------cording ---------
  void USERINFO_Save(BuildContext context) async {


  }



  void showAlertDialog(BuildContext context, String as_msg) async {
    String result = await showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('회원가입'),
          content: Text(as_msg),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context, "확인");
              },
            ),
          ],
        );
      },
    );
  }


}
