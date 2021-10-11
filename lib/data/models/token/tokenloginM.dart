//get generate model on data/models/user  with lib/json/token.json
//http://survey.khansia.co.id/api/utilisateurEnligne
class TokenLogin {
 late String ct;
  late String iv;
  late String s;
  late String all;

  TokenLogin({required this.ct, required this.iv, required this.s, required this.all});

  //menyimpan value ke sebuah variable
  TokenLogin.fromJson(Map<String, dynamic> value) {
    ct = value['ct'];
    iv = value['iv'];
    s = value['s'];
  }

  //membuat objek yang diisi dengan key untuk menyimpan data dan diubah menjadi json
  Map<String, dynamic> toJson() {
    final key = <String, dynamic>{};
    key['ct'] = ct;
    key['iv'] = iv;
    key['s'] = s;
    //menghasilkan nilai value key.ct , key.iv , key.s
    return key;
  }
}

