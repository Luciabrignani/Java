import 'package:flutter/material.dart';
import 'package:mutuapp/pages/mutua_page.dart';

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
                    const ListTile(
                      title: Text('New'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: const Text('Ok'),
                          onPressed: () {
                          },

                        ),
                        const SizedBox(width: 8),
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
          padding: const EdgeInsets.all(40.0),
          child: Center(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    title: Text('In progress'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('Ok'),
                        onPressed: () {
                        },
                      ),
                      const SizedBox(width: 8),
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
          padding: const EdgeInsets.all(40.0),
          child: Center(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    title: Text('Closed'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('Ok'),
                        onPressed: () {
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ]
    )
    );
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
