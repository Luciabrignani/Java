import '../../control/AppControl.dart';
import 'package:flutter/material.dart';

import 'Segnalibri.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextStyle style = const TextStyle(fontFamily: "Montserrat", fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final TextEditingController email =
        TextEditingController(text: 'luciabrignani.lb@gmail.com');

    final TextEditingController pwd = TextEditingController(text: 'lucia');

    final emailField = TextField(
      controller: email,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextField(
      controller: pwd,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(40.0))),
    );

    Widget _buttonLogin(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.pink,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 48.0),
          child: Text(
            'ACCEDI',
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
        ),
        onPressed: () async {
          await AppControl.LoginUser(email.text, pwd.text);

          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Segnalibri()));
        });

    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.black),
        extendBodyBehindAppBar: true,
        body: Center(
          child: SingleChildScrollView(
              child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                const Image(
                    image: AssetImage('assets/images/login.png'),
                    height: 350,
                    width: 350),
                const SizedBox(
                  height: 40.0,
                ),
                emailField,
                const SizedBox(
                  height: 40.0,
                ),
                passwordField,
                const SizedBox(
                  height: 40.0,
                ),
                _buttonLogin(context),
              ],
            ),
          )),
        ));
  }
}
