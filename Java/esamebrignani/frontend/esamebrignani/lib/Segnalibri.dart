import 'package:esamebrignani/Benvenuto.dart';
import 'package:esamebrignani/entity/User.dart';
import 'package:esamebrignani/login.dart';
import 'package:flutter/material.dart';

import 'ListSegnalibri.dart';
import 'control/AppControl.dart';
import 'control/SegnalibroStore.dart';

class Segnalibri extends StatefulWidget {
  const Segnalibri({Key? key}) : super(key: key);

  @override
  State<Segnalibri> createState() => _SegnalibriState();
}

class _SegnalibriState extends State<Segnalibri> {
  @override
  void initState() {
    super.initState();
    if (AppControl.getIndex() != -1) {
      desc.text = AppControl.getSegnalibro()[AppControl.getIndex()]
          .descrizione
          .toString();
      link.text =
          AppControl.getSegnalibro()[AppControl.getIndex()].link.toString();

      isVNew = false;
      isVUpt = true;
      isVDel = true;
      isVClear = true;
    } else {
      isVNew = true;
      isVUpt = false;
      isVDel = false;
      isVClear = false;
    }
  }

  bool isChecked = false;
  bool isVNew = true;
  bool isVUpt = true;
  bool isVDel = true;
  bool isVClear = true;
  final TextEditingController desc = TextEditingController(text: "");
  final TextEditingController link = TextEditingController(text: "");
  final TextEditingController tag = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          actions: [
            IconButton(
                icon: Icon(Icons.logout),
                tooltip: 'Logout',
                onPressed: () {
                  User u = User(
                      userid: 0,
                      firstName: "",
                      lastName: "",
                      mail: "",
                      role: "",
                      token: "",
                      error: "");

                  AppControl.setUser(u);
                  AppControl.clearSegnalibro();
                  AppControl.setIndex(-1);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Benvenuto()));
                })
          ],
        ),
        extendBodyBehindAppBar: true,
        body: Container(
            margin: EdgeInsets.only(top: 32.0),
            padding: const EdgeInsets.all(58.0),
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: _containerField()),
                const SizedBox(height: 20.0),
                Row(children: [
                  _listButton(),
                  const SizedBox(width: 50.0),
                  Visibility(
                    visible: isVNew,
                    child: _newButton(),
                  ),
                  Visibility(
                    visible: isVClear,
                    child: _clearButton(),
                  ),
                ]),
                const SizedBox(height: 20.0),
                Row(children: [
                  Visibility(
                    visible: isVUpt,
                    child: _updateButton(),
                  ),
                  const SizedBox(width: 50.0),
                  Visibility(
                    visible: isVDel,
                    child: _deleteButton(),
                  ),
                ])
              ],
            )),
      );

  Widget _containerField() => Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          children: [
            _descriptionField(),
            _linkField(),
            _tagField(),
            _checkCondiviso(),
          ],
        ),
      );

  Widget _descriptionField() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: TextField(
          controller: desc,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Inserisci la descrizione',
            hintStyle: TextStyle(fontSize: 17.0),
          ),
        ),
      );

  Widget _linkField() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: TextField(
          controller: link,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Inserisci il link',
            hintStyle: TextStyle(fontSize: 17.0),
          ),
        ),
      );

  Widget _tagField() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: TextField(
          controller: tag,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Inserisci etichetta',
            hintStyle: TextStyle(fontSize: 17.0),
          ),
        ),
      );

  Widget _checkCondiviso() => Row(
        children: [
          const SizedBox(width: 28.0),
          const Text(
            'Condiviso',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          Checkbox(
            checkColor: Colors.white,
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
        ],
      );

  Widget _newButton() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.pink,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: Column(
          children: [
            Row(
              children: const [
                Text(
                  'NUOVO',
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          ],
        ),
        onPressed: () async {
          var u = AppControl.getUser();
          if (u != null || u!.userid != 0) {
            await SegnalibroStore.postSegnalibro(
                u, desc.text, link.text, isChecked);
            desc.text = "";
            link.text = "";
            _showDlgNewSegnalibro();
          } else {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Login()));
          }
        },
      );

  Widget _listButton() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.pink,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: Column(
          children: [
            Row(
              children: const [
                Text(
                  'VEDI SEGNALIBRI',
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          ],
        ),
        onPressed: () async {
          var u = AppControl.getUser();
          var segnalibri;
          if (u != null || u!.userid != 0) {
            print(AppControl.getSegnalibro().length);
            AppControl.clearSegnalibro();
            print(AppControl.getSegnalibro().length);
            segnalibri = await SegnalibroStore.getSegnalibro(u);
          } else {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Login()));
          }
          if (segnalibri == null) {
            _showDialogSegnalibro();
          } else {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ListSegnalibri()));
          }
        },
      );

  Widget _updateButton() => ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.pink,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Column(
        children: [
          Row(
            children: const [
              Text(
                'AGGIORNA',
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ],
      ),
      onPressed: () async {
        var u = AppControl.getUser();
        var segnalibri;

        if (u != null || u!.userid != 0) {
          int index = AppControl.getIndex();
          var i = AppControl.getSegnalibro()[index].idsegnalibro.toString();
          segnalibri = await SegnalibroStore.putSegnalibro(
              u, i, desc.text, link.text, isChecked);
        } else {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Login()));
        }
        if (segnalibri == null) {
          _showDialogSegnalibro();
        } else {
          AppControl.clearSegnalibro();
          segnalibri = await SegnalibroStore.getSegnalibro(u);
          AppControl.setIndex(-1);
          desc.text = "";
          link.text = "";
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Segnalibri()));
          _showDlgAggSegnalibro();
        }
      });

  Widget _deleteButton() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.pink,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: Column(
          children: [
            Row(
              children: const [
                Text(
                  'ELIMINA',
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          ],
        ),
        onPressed: () async {
          var u = AppControl.getUser();
          var segnalibri;
          if (u != null || u!.userid != 0) {
            int index = AppControl.getIndex();
            var i = AppControl.getSegnalibro()[index].idsegnalibro.toString();
            segnalibri = await SegnalibroStore.delSegnalibro(u, i);
          } else {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Login()));
          }

          if (segnalibri == null) {
            _showDialogErrorDel();
          } else {
            AppControl.clearSegnalibro();
            segnalibri = await SegnalibroStore.getSegnalibro(u);
            AppControl.setIndex(-1);
            desc.text = "";
            link.text = "";
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Segnalibri()));
            _showDlgDelSegnalibro();
          }
        },
      );

  Widget _clearButton() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.pink,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: Column(
          children: [
            Row(
              children: const [
                Text(
                  'PULISCI',
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          ],
        ),
        onPressed: () {
          desc.text = "";
          link.text = "";
          AppControl.setIndex(-1);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Segnalibri()));
        },
      );

  Future<void> _showDialogSegnalibro() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Mi dispiace'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Non sono presenti segnalibri per te'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showDlgAggSegnalibro() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Complimenti'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Segnalibro aggiornato con successo !!!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showDlgNewSegnalibro() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Complimenti'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Segnalibro creato con successo !!!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showDialogErrorDel() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Mi dispiace'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Non è possibile eliminare il segnalibro selezionato'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showDlgDelSegnalibro() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Ottimo'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('il tuo segnalibro è stato cancellato con successo!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
