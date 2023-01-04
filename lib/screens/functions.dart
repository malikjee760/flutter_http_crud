import 'dart:convert';
import 'dart:io';

import 'package:flutter_http_crud/model/post.dart';
import 'package:flutter_http_crud/util/const.dart';
import 'package:http/http.dart' as http;

Future<Post?> getData() async {
  http.Response response = await http.get(Uri.parse(BASE_URL),
  // headers: {
  //   HttpHeaders.authorizationHeader: 'Basic your_api_token_here',
  // },
  );
  print(jsonDecode(response.body));
  return null;
}

void createUser(int id, int jobid, String title, String body) async {
  final response = await http.post(Uri.parse(BASE_URL), body: {
    "userId": id.toString(),
    "id": jobid.toString(),
    "title": title.toString(),
    "body": body.toString(),
  });
  print(response.body);
}

Future<Post> deleteUser(int id) async {
  final http.Response response = await http
      .delete(Uri.parse(BASE_URL+'/$id'));

  if (response.statusCode == 200) {
    print('data deleted');
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to delete album.');
  }
}

Future<Post> updatePost(int id, String title) async {
  final response = await http.put(
    Uri.parse(BASE_URL+'/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 200) {
    print('data Updated');
    return Post.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to update album.');
  }
}
