class Segnalibri {
  String? idsegnalibro = "";
  String? descrizione = "";
  String? link = "";
  String? utente = "";
  bool? condiviso = false;
  String? creazione = "";
  String? aggiornamento = "";
  String? utenteagg = "";
  String? etichette = "";
  String? mail = "";
  bool? cancellato = false;
  String? version = "";
  String? error;

  Segnalibri(
      {this.idsegnalibro,
      this.descrizione,
      this.link,
      this.utente,
      this.condiviso,
      this.creazione,
      this.aggiornamento,
      this.utenteagg,
      this.etichette,
      this.mail,
      this.error});

  Segnalibri.fromJson(Map<String, dynamic> json) {
    idsegnalibro = json['idsegnalibro'];
    descrizione = json['descrizione'];
    link = json['link'];
    utente = json['utente'];
    condiviso = json['condiviso'];
    creazione = json['dtcreazione'];
    mail = json['mail'];
  }

  Segnalibri.fromJsonPost(Map<String, dynamic> json) {
    idsegnalibro = json['id'];
    descrizione = json['descrizione'];
    link = json['link'];
    utente = json['utente'];
    condiviso = json['condiviso'];
    creazione = json['dtcreazione'];
    aggiornamento = json['aggiornamento'];
    utenteagg = json['utenteagg'];
    etichette = json['etichette'];
    mail = json['mail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['idbkm'] = idsegnalibro;
    data['descrizione'] = descrizione;
    data['link'] = link;
    data['utente'] = utente;
    data['condiviso'] = condiviso;
    data['creazione'] = creazione;
    data['aggiornamento'] = aggiornamento;
    data['utenteagg'] = utenteagg;
    data['mail'] = mail;
    data['etichette'] = etichette;

    return data;
  }
}
