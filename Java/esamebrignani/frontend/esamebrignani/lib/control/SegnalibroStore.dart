import 'package:esamebrignani/entity/Segnalibri.dart';

import '../entity/User.dart';
import '../entity/Segnalibri.dart';
import 'AppControl.dart';
import '../service/rest.dart';

class SegnalibroStore {
  static Future postSegnalibro(
      User usr, String desc, String link, bool shared) async {
    dynamic data = {'descrizione': desc, 'link': link, 'condiviso': shared};
    late Segnalibri _segnalibri;
    try {
      print(usr.mail);

      var resp = await rest.postRest("/segnalibri", true, usr.token!, data);
      _segnalibri = Segnalibri.fromJsonPost(resp);
      print(resp);
      return (_segnalibri);
    } catch (e) {
      return Segnalibri(error: e.toString());
    }
  }

  static Future getSegnalibro(User usr) async {
    var _segnalibri = <Segnalibri>[];
    var resp = [];

    print(usr.firstName);

    try {
      resp = await rest.getRest("/segnalibri", true, usr.token!, 1, 100);
      resp.forEach((element) {
        print(element);
        _segnalibri.add(Segnalibri.fromJson(element));
      });

      _segnalibri.forEach((s) {
        print("Add..${s.descrizione}");
        AppControl.addSegnalibro(s);
      });
      return (true);
    } catch (e) {
      print(e);
      return Segnalibri(error: e.toString());
    }
  }

  static Future getSingleSegnalibro(User usr, String id) async {
    late Segnalibri _segnalibri;

    try {
      var resp =
          await rest.getRest("/segnalibri/$id", true, usr.token!, 1, 100);

      _segnalibri = Segnalibri.fromJson(resp);

      return (_segnalibri);
    } catch (e) {
      return Segnalibri(error: e.toString());
    }
  }

  static Future putSegnalibro(
      User usr, String id, String desc, String link, bool shared) async {
    dynamic data = {
      'id': id,
      'descrizione': desc,
      'link': link,
      'condiviso': shared,
    };
    print("arrivato al put ....");
    late Segnalibri _segnalibri;
    try {
      var resp = await rest.putRest("/segnalibri", true, usr.token!, data);
      _segnalibri = Segnalibri.fromJson(resp);
      return (_segnalibri);
    } catch (e) {
      return Segnalibri(error: e.toString());
    }
  }

  static Future delSegnalibro(User usr, String id) async {
    dynamic data = {'idSegnalibro': id};
    try {
      var resp = await rest.delRest("/segnalibri", true, usr.token!, data);
      return (resp);
    } catch (e) {
      return Segnalibri(error: e.toString());
    }
  }

  static Future patchSegnalibro(User usr, String id, String etichette) async {
    dynamic data = {'idSegnalibro': id, 'etichette': etichette};
    print("arrivato al put ....");
    late Segnalibri _segnalibri;
    try {
      var resp = await rest.patchRest("/segnalibro", true, usr.token!, data);
      _segnalibri = Segnalibri.fromJson(resp);
      return (_segnalibri);
    } catch (e) {
      return Segnalibri(error: e.toString());
    }
  }
}
