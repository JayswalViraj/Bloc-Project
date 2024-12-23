import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginRepository {
  Future<dynamic> loginApi(
      {required String username, required String password}) async {
    var url = Uri.https("dummyjson.com","/auth/login");
    var response = await http
        .post(url, body: {"username": username, "password": password});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return jsonDecode(response.body) ;
  }


}