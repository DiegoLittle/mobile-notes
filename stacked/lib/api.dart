import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:stacked_arch/datamodels/note_model.dart';
import 'dart:convert';
import 'datamodels/todo_model.dart';


class API {
  static const String _apiEndpoint = "https://jsonplaceholder.typicode.com/todos";

  Future<dynamic> getTodos() async {
    var url = Uri.parse(_apiEndpoint);
    var response = await http.get(url);

    if(response.statusCode == 200){
      var todos = (json.decode(response.body) as List)
      .map((todo)=> TodoItemModel.fromJson(todo))
      .toList();
      // print(todos);
      return todos;
    }
    return "Could not fetch the todos";
  }
    Future<dynamic> getNotes(String access_token) async {
    String endpoint = dotenv.env['API_URL'] ?? "";
    var urlString = endpoint+"/user/notes?access_token="+access_token;
    var url = Uri.parse(urlString);
    var response = await http.get(url);
    // return response;
    // print();
    if(response.statusCode == 200){
      // print(json.decode(response.body));
      var body = utf8.decode(response.body.runes.toList());
      var notes = (json.decode(body) as List)
      .map((note)=> Note.fromJson(note))
      .toList();
      // print(notes);
      return notes;
    }
  }
    Future<dynamic> postNote(String access_token,Object note) async {
      String endpoint = dotenv.env['API_URL'] ?? "";
    var urlString = endpoint+ "/user/notes?access_token="+access_token;
    var url = Uri.parse(urlString);
    var response = await http.post(url,body:jsonEncode({"note":note}));
    // return response;
    if(response.statusCode == 200){
      print(json.decode(response.body));
      var notes = (json.decode(response.body) as List)
      .map((note)=> Note.fromJson(note))
      .toList();
      print(notes);
      return notes;
    }
  }
    Future<dynamic> updateNote(String access_token,Object note) async {
      String endpoint = dotenv.env['API_URL'] ?? "";
    var urlString = endpoint+ "/user/notes?access_token="+access_token;
    var url = Uri.parse(urlString);
    var response = await http.put(url,body:jsonEncode({"note":note}));
    // return response;
    if(response.statusCode == 200){
      print(json.decode(response.body));
      var notes = (json.decode(response.body) as List)
      .map((note)=> Note.fromJson(note))
      .toList();
      print(notes);
      return notes;
    }
  }
    Future<dynamic> deleteNote(String access_token,Object note) async {
      String endpoint = dotenv.env['API_URL'] ?? "";
    var urlString = endpoint+ "/user/notes?access_token="+access_token;
    var url = Uri.parse(urlString);
    var response = await http.delete(url,body:jsonEncode({"note":note}));
    // return response;
    if(response.statusCode == 200){
      print(json.decode(response.body));
      var notes = (json.decode(response.body) as List)
      .map((note)=> Note.fromJson(note))
      .toList();
      print(notes);
      return notes;
    }
  }
    Future<dynamic> uploadFile(String access_token,String path) async {
    String endpoint = dotenv.env['API_URL'] ?? "";
    var urlString = endpoint+ "/user/files?access_token="+access_token;
    var url = Uri.parse(urlString); 
    http.MultipartRequest request = new http.MultipartRequest("POST", url);
    http.MultipartFile multipartFile = await http.MultipartFile.fromPath("file", path);
    request.files.add(multipartFile);
    print(request);
    http.StreamedResponse response = await request.send();

    // return response;
   
  }

}