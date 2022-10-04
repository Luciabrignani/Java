import 'package:flutter/material.dart';
import 'package:mutuapp/pages/mutua_page.dart';

import '../control/MutuaControl.dart';
import '../entity/Status.dart';
import '../entity/mutua.dart';

class HistoricalPage extends StatefulWidget {
  const HistoricalPage({Key? key}) : super(key: key);

  @override
  State<HistoricalPage> createState() => _HistoricalPageState();
}

class _HistoricalPageState extends State<HistoricalPage> {
  _HistoricalPageState() {
    if (MutuaControl.getMutua().isNotEmpty) {
      Mutua n = new Mutua.create();
      n = MutuaControl.getMutuaStatus(Status.NEW);

      if (n.start != null) {
        data_start_new.text = n.start.toString();
        data_end_new.text = n.end.toString();
        protocolNumber_new.text = n.protocolNumber.toString();
      } else {
        print("non c'è una new");
      }
    }
  }

  final TextEditingController data_start_new = TextEditingController(text: "");
  final TextEditingController data_end_new = TextEditingController(text: "");
  final TextEditingController protocolNumber_new = TextEditingController(text: "");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Storico della Mutua'),
          backgroundColor: Colors.red[800],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MutuaPage()));
            },
            backgroundColor: Colors.red[800],
            child: const Icon(Icons.add)),
        drawer: _myDrawerWithAccountHeader(context),
        body: Column(children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Center(
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(controller: data_start_new,
                      ),
                      TextField(controller: data_end_new),
                      TextField(controller: protocolNumber_new),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget> [
                          TextButton(
                            child: const Text('Modifica'),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
              child: Center(
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(),
                      TextField(),
                      TextField(),
                      TextButton(
                        child: const Text('Ok'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
              child: Center(
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(),
                      TextButton(
                        child: const Text('Ok'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]));
  }
}

Widget _myDrawerWithAccountHeader(BuildContext context) {
  return Drawer(
    child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/logo_laser.png'))),
          accountName: const Text(
            "User",
            style: TextStyle(color: Colors.black),
          ),
          accountEmail: const Text(
            "Email",
            style: TextStyle(color: Colors.black),
          ),
          currentAccountPicture: Row(
            children: [
              CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: const Icon(
                    Icons.person,
                    color: Colors.black,
                  )),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.history),
          title: const Text('Historical'),
          onTap: () {},
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {},
        ),
      ],
    ),
  );
}
