import 'package:esamebrignani/control/AppControl.dart';
import 'package:flutter/material.dart';

import 'Segnalibri.dart';

class ListSegnalibri extends StatefulWidget {
  const ListSegnalibri({Key? key}) : super(key: key);

  @override
  State<ListSegnalibri> createState() => _ListSegnalibri();
}

class _ListSegnalibri extends State<ListSegnalibri> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.black),
        extendBodyBehindAppBar: true,
        body: getSegnalibro());
  }

  int _selectedIndex = -1;

  getSegnalibro() {
    print(AppControl.getSegnalibro().length);
    return ListView.builder(
        itemCount: AppControl.getSegnalibro().length,
        itemBuilder: (context, index) {
          return ListTile(
            selectedColor: Colors.black,
            selected: index == _selectedIndex,
            title:
                Text(AppControl.getSegnalibro()[index].descrizione.toString()),
            subtitle: Text(AppControl.getSegnalibro()[index].link.toString()),
            onTap: () {
              setState(() {
                _selectedIndex = index;

                AppControl.setIndex(index);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Segnalibri()));
              });
            },
          );
        });
  }
}
