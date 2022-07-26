import '../entity/User.dart';
import '../entity/Segnalibri.dart';
import '../control/SegnalibroStore.dart';
import 'UserStore.dart';

class AppControl {
  static User? _usr;
  static final _segnalibri = <Segnalibri>[];
  static int _index = -1;

  static setIndex(int i) {
    _index = i;
  }

  static getIndex() {
    return _index;
  }

  static setUser(User u) {
    _usr = u;
  }

  static User? getUser() {
    if (_usr != null) {
      return _usr;
    } else {
      User u = User(
          userid: 0,
          firstName: "",
          lastName: "",
          mail: "",
          role: "",
          token: "",
          error: "");
      return u;
    }
  }

  static Future<User?> LoginUser(String email, String pass) async {
    return await UserStore.getUser(email, pass);
  }

  static Future<User?> CreaUser(
      String nome, String cognome, String email, String pass) async {
    return await UserStore.creaUser(nome, cognome, email, pass);
  }

  static addSegnalibro(Segnalibri s) {
    _segnalibri.add(s);
  }

  static List<Segnalibri> getSegnalibro() {
    return _segnalibri;
  }

  static clearSegnalibro() {
    _segnalibri.clear();
  }

  static Future CaricaSegnalibro() async {
    clearSegnalibro();
    return await SegnalibroStore.getSegnalibro(_usr!);
  }

  static Future AggSegnalibro(String desc, String link, bool shared) async {
    await SegnalibroStore.putSegnalibro(
        _usr!, _segnalibri[_index].idsegnalibro!, desc, link, shared);
    await CaricaSegnalibro();
    return true;
  }

  static Future AggEtichetta(String etichette) async {
    await SegnalibroStore.patchSegnalibro(
        _usr!, _segnalibri[_index].idsegnalibro!, etichette);
    await CaricaSegnalibro();
    return true;
  }

  static Future delSegnalibro() async {
    await SegnalibroStore.delSegnalibro(
        _usr!, _segnalibri[_index].idsegnalibro!);
    await CaricaSegnalibro();
    return true;
  }
}
