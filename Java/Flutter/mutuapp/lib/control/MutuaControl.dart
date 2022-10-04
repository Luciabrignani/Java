import '../entity/Status.dart';
import '../entity/mutua.dart';

class MutuaControl {
  static final mutua = <Mutua>[];

  static Mutua creaMutua(
      String reason, DateTime start, DateTime end, String protocolNumber) {
    Mutua m = Mutua.create();
    m = m.copyWith(
        reason: reason, start: start, end: end, protocolNumber: protocolNumber);
    return m;
  }

  static addMutua(Mutua m) {
    mutua.add(m);
  }

  static Mutua aggMutua(Mutua m, Status st) {
    m = m.copyWith(status: st);
    return m;
  }

  static List<Mutua> getMutua() {
    return mutua;
  }

  static List<Mutua> getMutuaFiltred(Status st) {
    return mutua.where((e) => e.status.name == st.name).toList();
  }

  static Mutua getMutuaStatus(Status st) {
    return getMutuaFiltred(st)[0];
  }

  static clearMutua() {
    mutua.clear();
  }
}
