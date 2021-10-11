import 'dart:convert'; //json encode

import 'package:smart_survey1/data/api/loginP.dart'; //api login
import 'package:smart_survey1/data/models/user/userM.dart'; //model user

class UserR {
  final LoginProvider loginP = LoginProvider();

//inisalisasi type class dengan return sebuah model
  Future getToken(String username, String password) async {
    Map<String, dynamic>? enkrip = await loginP.getToken(username, password);

    // print(json.encode(tokenenkrip));
    /*
      {"ct":"PnpRMxJxcmhaobzFsEdCSfg/5GbMXya0+6dRssU2KO9kqDG20JDYuIXC8R
      uvgNe7EQauHd4U8UiouZyW3CqsZLG/Y/h0/efYkEOeyW8D4e5FzgG3STDFP593fh99
      +gNAeACyjSvE3+0kAFtCm+2HPPfbqGvSXgAZzTwJoAIWzo0o7cxI4lslbSMK/uzytpP
      EhVLcDxbJJDgtn8CtLdk9w0TwbOV4VCdQXWt+qgf5gNHHlHoE5wNzqm3ajFbvEnEqkEb
      iGxBUgedfmmDMQuP5JVxXopXt2uCeLbldEmi94fowTI4Ome1QKEpflOwK7vvyQr1Eb+r/
      hkUx8x5CsfZw8fsIUcJd/RM0zvvYk0fORyth9ISjuXTaViPY2RWuN5CAfW21/3Kzf2gkRuEn
      7eGzRw==",
      "iv":"26f7830bf4cce9bdd02dbba93d3b57d8",
      "s":"c17d0a9596940c6f"}
    */
    return json.encode(enkrip);
  }

//inisalisasi type class dengan return sebuah model
  Future<User?> getUser(String enkrip) async {
    var user = await loginP.getUser(enkrip);

    // print(user);

    /*
       {guid: 0, code: 0, info: user_auth_success, 
       data: {iduser: 1, username: danirusdanx, name: danirusdan, role: 10, 
       status: 10, retries: NULL, token: 6d1e1a39640544e0790cc3791e0ea91f, 
       update_date: 2021-07-21 16:18:15.785228+07}}p
    */

    /*
  menyimpan data hasil dekrip dengan format yang dimiliki model user
  */
    if (user != null) {
      return User.fromJson(user);
    } else {
      return null;
    }
  }
}
