import 'package:esamebrignani/registrazione.dart';
import 'package:flutter/material.dart';

class Benvenuto extends StatefulWidget {
  const Benvenuto({Key? key}) : super(key: key);

  @override
  State<Benvenuto> createState() => _BenvenutoState();
}

class _BenvenutoState extends State<Benvenuto> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          padding: const EdgeInsets.all(58.0),
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            children: [_welcomeWidget(), _signInButton(context)],
          ),
        ),
      );

  Widget _welcomeWidget() => Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
                image: AssetImage('assets/images/Photo.png'),
                fit: BoxFit.fitWidth),
            Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Center(
                child: Text(
                  'La tua App di Segnalibri',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.pink,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  Widget _signInButton(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.teal,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 48.0),
          child: Text(
            'CIAO!',
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
        ),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Registrazione(),
          ),
        ),
      );
}
