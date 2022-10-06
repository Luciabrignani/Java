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
  @override
  void initState() {
    super.initState();
    load();
  }

  load() {
    //controllo la mutua nello status NEW
    if (MutuaControl.getMutua()
        .where((e) => e.status == Status.NEW)
        .isNotEmpty) {
      if (MutuaControl.getMutuaStatus(Status.NEW).start != null &&
          MutuaControl.getMutuaStatus(Status.NEW).end != null &&
          MutuaControl.getMutuaStatus(Status.NEW).protocolNumber != null) {
        data_start_new.text =
            MutuaControl.getMutuaStatus(Status.NEW).start.toString();
        data_end_new.text =
            MutuaControl.getMutuaStatus(Status.NEW).end.toString();
        protocolNumber_new.text =
            MutuaControl.getMutuaStatus(Status.NEW).protocolNumber.toString();
      } else {
        data_start_new.text = "";
        data_end_new.text = "";
        protocolNumber_new.text = "";
      }
    } else {
      data_start_new.text = "";
      data_end_new.text = "";
      protocolNumber_new.text = "";
    }

    //Controllo la mutua nello Status INPROGRESS
    if (MutuaControl.getMutua()
        .where((e) => e.status == Status.INPROGRESS)
        .isNotEmpty) {
      if (MutuaControl.getMutuaStatus(Status.INPROGRESS).start != null &&
          MutuaControl.getMutuaStatus(Status.INPROGRESS).end != null &&
          MutuaControl.getMutuaStatus(Status.INPROGRESS).protocolNumber !=
              null) {
        data_start_inProgress.text =
            MutuaControl.getMutuaStatus(Status.INPROGRESS).start.toString();
        data_end_inProgress.text =
            MutuaControl.getMutuaStatus(Status.INPROGRESS).end.toString();
        protocolNumber_inProgress.text =
            MutuaControl.getMutuaStatus(Status.INPROGRESS)
                .protocolNumber
                .toString();
      } else {
        data_start_inProgress.text = "";
        data_end_inProgress.text = "";
        protocolNumber_inProgress.text = "";
      }
    } else {
      data_start_inProgress.text = "";
      data_end_inProgress.text = "";
      protocolNumber_inProgress.text = "";
    }

    //Controllo la mutua in status CLOSED
    if (MutuaControl.getMutua()
        .where((e) => e.status == Status.CLOSED)
        .isNotEmpty) {
      listClosed();
    }
  }

  final TextEditingController data_start_new = TextEditingController(text: "");
  final TextEditingController data_end_new = TextEditingController(text: "");
  final TextEditingController protocolNumber_new =
      TextEditingController(text: "");

  final TextEditingController data_start_inProgress =
      TextEditingController(text: "");
  final TextEditingController data_end_inProgress =
      TextEditingController(text: "");
  final TextEditingController protocolNumber_inProgress =
      TextEditingController(text: "");

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
              child: Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MutuaPage()));
                    load();
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: data_start_new,
                        enabled: false,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                      ),
                      TextField(
                        controller: data_end_new,
                        enabled: false,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                      ),
                      TextField(
                        controller: protocolNumber_new,
                        enabled: false,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                              onPressed: () {
                                if (MutuaControl.getMutuaStatus(Status.NEW)
                                            .start !=
                                        null &&
                                    MutuaControl.getMutuaStatus(Status.NEW)
                                            .end !=
                                        null &&
                                    MutuaControl.getMutuaStatus(Status.NEW)
                                            .protocolNumber !=
                                        null) {
                                  MutuaControl.aggMutua(
                                      MutuaControl.getMutuaStatus(Status.NEW),
                                      Status.INPROGRESS);
                                }
                                load();
                              },
                              child: Text(
                                "Conferma",
                                style: TextStyle(color: Colors.red[800]),
                              )),
                          SizedBox(width: 8),
                        ],
                      )
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
                      TextField(
                        controller: data_start_inProgress,
                        enabled: false,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                      ),
                      TextField(
                        controller: data_end_inProgress,
                        enabled: false,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                      ),
                      TextField(
                        controller: protocolNumber_inProgress,
                        enabled: false,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                if (MutuaControl.getMutuaStatus(
                                                Status.INPROGRESS)
                                            .start !=
                                        null &&
                                    MutuaControl.getMutuaStatus(
                                                Status.INPROGRESS)
                                            .end !=
                                        null &&
                                    MutuaControl.getMutuaStatus(
                                                Status.INPROGRESS)
                                            .protocolNumber !=
                                        null) {
                                  MutuaControl.aggMutua(
                                      MutuaControl.getMutuaStatus(
                                          Status.INPROGRESS),
                                      (Status.CLOSED));
                                }
                                load();
                              },
                              child: Text(
                                "Conferma",
                                style: TextStyle(color: Colors.red[800]),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: const Padding(
              padding: EdgeInsets.all(40),
              child: Center(
                child: Card(
                ),
              ),
            ),
          ),
        ]));
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

  listClosed() {
    return ListView.builder(
        itemCount: MutuaControl.getMutuaFiltred(Status.CLOSED).length,
        itemBuilder: (context, index) {
          return ListTile(
            selectedColor: Colors.blue,
            title: Text(MutuaControl.getMutuaFiltred(Status.CLOSED)[index]
                .protocolNumber
                .toString()),
            subtitle: Text(
                "${MutuaControl.getMutuaFiltred(Status.CLOSED)[index].start.toString()} - ${MutuaControl.getMutuaFiltred(Status.CLOSED)[index].start.toString()} - ${MutuaControl.getMutuaFiltred(Status.CLOSED)[index].reason.toString()}"),
            onTap: () {},
          );
        });
  }
}
