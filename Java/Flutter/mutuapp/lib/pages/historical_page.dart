import 'package:flutter/material.dart';

class HistoricalPage extends StatefulWidget {
  const HistoricalPage({Key? key}) : super(key: key);

  @override
  State<HistoricalPage> createState() => _HistoricalPageState();
}

class _HistoricalPageState extends State<HistoricalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Storico della Mutua'),
          backgroundColor: Colors.red[800],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
            backgroundColor: Colors.red[800]),
        drawer: _myDrawerWithAccountHeader(context));
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
          accountName: const Text("User", style: TextStyle(color: Colors.black),),
          accountEmail: const Text("Email", style: TextStyle(color: Colors.black),),
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
          onTap: () {

          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {

          },
        ),
      ],
    ),
  );
}
