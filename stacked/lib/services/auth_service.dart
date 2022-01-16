import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthService {
  bool is_authenticated = false;
  String access_token = "";

  Future<dynamic> postLogin(username, password) async {
    String urlString = dotenv.env['API_URL'] ?? "";
    var url = Uri.parse(urlString + "/token");
    var response = await http
        .post(url, body: {"username": username, "password": password});

    if (response.statusCode == 200) {
      is_authenticated = true;
      access_token = json.decode(response.body)["access_token"];
      return (access_token);
    }
    // return "Could not fetch the todos";
  }

  Future<dynamic> postSignup(username, password) async {
    String urlString = dotenv.env['API_URL'] ?? "";
    var url = Uri.parse(urlString + "/users/");
    print(url);
    // print(json.encode({"email": username, "password": password}));
    var response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: json.encode({"email": username, "password": password}));
        print(response.statusCode);
        print(response.body);
        return response;
    // if(response.statusCode == 200){
    //   return response;
    // }
    // else if(response.statusCode == 409){
    //   return response;
    // }

    // return "Could not fetch the todos";
  }
}
