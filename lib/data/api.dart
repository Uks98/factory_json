

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'data.dart';

Future<List<Album>> getTodo() async {
  const url = "http://jsonplaceholder.typicode.com/photos";
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    List body = jsonDecode(response.body);
    var postList = body.map((e) => Album.fromJson(e)).toList();
    print(postList.first.title);
    return postList;
  }
  throw Exception("오류가 발생했습니다.");
}