class Datum {
  Datum({
    this.idProfile,
    this.judul,
    this.deskripsi,
    this.userid,
    this.publish,
    this.mandatori,
    this.limitx,
    this.endDate,
    this.createDate,
    this.updateDate,
    this.batasIsi,
    this.masaAktif,
    this.privasix,
    this.headerColor,
    this.backColor,
    this.layoutSize,
    this.judulView,
    this.deskripsiView,
    this.headerView,
    this.typeContent,
    this.sortData,
    this.tipeBobot,
    this.bobotValue,
    this.materiView,
    this.statusSoal,
    this.tipeKuiz,
    this.formEncode,
    this.useOnkb,
    this.flowEncode,
  });

  dynamic idProfile;
  dynamic judul;
  dynamic deskripsi;
  dynamic userid;
  dynamic publish;
  dynamic mandatori;
  dynamic limitx;
  dynamic endDate;
  dynamic createDate;
  dynamic updateDate;
  dynamic batasIsi;
  dynamic masaAktif;
  dynamic privasix;
  dynamic headerColor;
  dynamic backColor;
  dynamic layoutSize;
  dynamic judulView;
  dynamic deskripsiView;
  dynamic headerView;
  dynamic typeContent;
  dynamic sortData;
  dynamic tipeBobot;
  dynamic bobotValue;
  dynamic materiView;
  dynamic statusSoal;
  dynamic tipeKuiz;
  dynamic formEncode;
  dynamic useOnkb;
  dynamic flowEncode;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idProfile: json["id_profile"],
        judul: json["judul"],
        deskripsi: json["deskripsi"],
        userid: json["userid"],
        publish: json["publish"],
        mandatori: json["mandatori"],
        limitx: json["limitx"],
        endDate: json["end_date"],
        createDate: json["create_date"],
        updateDate: json["update_date"],
        batasIsi: json["batas_isi"],
        masaAktif: json["masa_aktif"],
        privasix: json["privasix"],
        headerColor: json["header_color"],
        backColor: json["back_color"],
        layoutSize: json["layout_size"],
        judulView: json["judul_view"],
        deskripsiView: json["deskripsi_view"],
        headerView: json["header_view"],
        typeContent: json["type_content"],
        sortData: json["sort_data"],
        tipeBobot: json["tipe_bobot"],
        bobotValue: json["bobot_value"],
        materiView: json["materi_view"],
        statusSoal: json["status_soal"],
        tipeKuiz: json["tipe_kuiz"],
        formEncode: json["form_encode"],
        useOnkb: json["use_onkb"],
        flowEncode: json["flow_encode"],
      );

  Map<String, dynamic> toJson() => {
        "id_profile": idProfile,
        "judul": judul,
        "deskripsi": deskripsi,
        "userid": userid,
        "publish": publish,
        "mandatori": mandatori,
        "limitx": limitx,
        "end_date": endDate,
        "create_date": createDate,
        "update_date": updateDate,
        "batas_isi": batasIsi,
        "masa_aktif": masaAktif,
        "privasix": privasix,
        "header_color": headerColor,
        "back_color": backColor,
        "layout_size": layoutSize,
        "judul_view": judulView,
        "deskripsi_view": deskripsiView,
        "header_view": headerView,
        "type_content": typeContent,
        "sort_data": sortData,
        "tipe_bobot": tipeBobot,
        "bobot_value": bobotValue,
        "materi_view": materiView,
        "status_soal": statusSoal,
        "tipe_kuiz": tipeKuiz,
        "form_encode": formEncode,
        "use_onkb": useOnkb,
        "flow_encode": flowEncode,
      };
}
