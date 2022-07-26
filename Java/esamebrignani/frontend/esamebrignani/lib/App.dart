import 'package:flutter/material.dart';

import 'Benvenuto.dart';

//class App extends StatelessWidget {
class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Segnalibri App',
      home: Benvenuto(),
      debugShowCheckedModeBanner: false,
    );
  }
}
