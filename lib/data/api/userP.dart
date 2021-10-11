import 'dart:convert';

import 'package:get/get.dart';

class UserProvider extends GetConnect {
  //baseurl
  final url = 'https://reqres.in/api/users';

  //get request
  Future<Response> getUser() {
    return get(url);
  }

  //post data

  Future<Response> postUser(String name, String job) {
    final body = json.encode({
      'name': name,
      'job': job,
    });

    return post(url, body);
  }

  //delete data
  Future<Response> deleteUser(String id) {
    return delete(url + '/$id');
  }

  //update data
  Future<Response> updataUser(String id, String name, String job) {
    final body = json.encode({
      'name': name,
      'job': job,
    });

    return patch(url + '/$id', body);
  }
}
