import 'package:get/get.dart';

/*
class getconnect dapat menggunakan method seperti post,put,delete,patch
*/

class LoginProvider extends GetConnect {
  /*membuat sebuah class future yang akan mengirim 
  nilai nanti Future.then((value)) (var value bebas)
  setelah dieksekusi dengan type map { String "k" : Dyanamic v}
  */
  
  Future<Map<String, dynamic>?> getToken(
      String username, String password) async {
    const endpoint = '/utilisateurEnligne';
    final header = {'Content-Type': 'application/x-www-form-urlencoded'};
    final body = 'usernam3=$username&passw0rds=$password&devid=-&fcm=-';
    /*usernam3 : username
      passw0rds : password
      devid : -
      fcm: -
    */

    /* melakukan post data
    */
    var response = await post(
      'http://survey.khansia.co.id/api' + endpoint,
      body,
      headers: header,
    );
    if (response.statusCode == 200) {
      /*  contoh response body 
        {ct: uTuUZ6Hp+F64CBWssWkSPqUt3HpLedASRbXztzjUPLVEcmaIKzLjZrRdA6
        UvdtiXk2JPgO11ENqFUilaLX3a1jXU5/OKDGx49qvjU3BxVPRGJeHRTspr1yLOh
         iv: 99061ba132b34d9582e33ac7cd626582, 
         s: 00b130985ee42b8b}
      */
      // print(response.body);
      return response.body;
    } else {
      print('failed connection' + endpoint);
      return null;
    }
  }

  Future<Map<String, dynamic>?> getUser(String enkriptoken) async {
    const endpoint = '/offeneVerschlussel';
    /*
      body form data
    */
    final body = FormData({
      'entrez': enkriptoken,
      'replace': '0',
    });
    /*
      {"ct":"KZdBzKPgAeaTiiMxigh8e9m9VleKerzuCZGf8fR08+E6Y/XQpcXpfIzZc
      ijfq45L06biBQYBxGrx4cSOeD6rd+9+DwlN+c4HuQTKDX6CFiMmbyPhCojwgsqYE",
      "iv":"a8150459840e1d9165d5adb3f1523bda",
      "s":"168d1c9d0920a989"}
    */
    //post data
    var response = await post(
      'http://survey.khansia.co.id/api' + endpoint,
      body,
    );
    if (response.statusCode == 200) {
      /*
         {guid: 0, code: 0, info: user_auth_success, data: 
         {iduser: 1, username: danirusdanx, name: danirusdan, role: 10, 
         status: 10, retries: NULL, token: b544e96a3469921a34420e0b8e54c6dc, 
         update_date: 2021-07-21 09:46:04.266364+07}}
      */
      // print(response.body);
      return response.body;
    } else {
      print('failed connection' + endpoint);
      print(response.statusText);
      return null;
    }
  }
}
