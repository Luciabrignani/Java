import 'package:esamebrignani/login.dart';

import '../../control/AppControl.dart';
import 'package:flutter/material.dart';
import 'entity/User.dart';

class Registrazione extends StatefulWidget {
  @override
  State<Registrazione> createState() => _RegistrazioneState();
}

class _RegistrazioneState extends State<Registrazione> {
  TextStyle style = const TextStyle(fontFamily: "Montserrat", fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController(text: '');
    final TextEditingController pwd = TextEditingController(text: '');
    final TextEditingController nome = TextEditingController(text: '');
    final TextEditingController cognome = TextEditingController(text: '');

    final nomeField = TextField(
      controller: nome,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Nome",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final cognomeField = TextField(
      controller: cognome,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Cognome",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

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
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    Widget _buttonRegistrati(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.pink,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 48.0),
          child: Text(
            'Registrati',
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
        ),
        onPressed: () async {
          await AppControl.CreaUser(
              nome.text, cognome.text, email.text, pwd.text);

          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Login()));
        });
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          actions: [
            IconButton(
                icon: Icon(Icons.key),
                tooltip: 'Login',
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Login()));
                })
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
              child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                nomeField,
                const SizedBox(
                  height: 40.0,
                ),
                cognomeField,
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
                _buttonRegistrati(context),
              ],
            ),
          )),
        ));
  }
}
