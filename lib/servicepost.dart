import 'dart:convert';
import 'package:blog/modelpost.dart';
import 'package:http/http.dart' as http;

class PostApiService
{
  Future<dynamic> sendData(
      String post
      ) async
  {
    var client = http.Client();
    var apiUri = Uri.parse("http://192.168.154.143:3001/api/post/addpost");
    var response = await client.post(apiUri,
      headers: <String,String>
      {
        "Content-Type":"application/json; charset=UTF-8"
      },
      body: jsonEncode(<String,String>
      {
        "post" : post
      }
      ),
    );
    if(response.statusCode==200)
    {
      var resp = response.body;
      return jsonDecode(resp);
    }
    else
    {
      throw Exception("Failed to send data");
    }
  }

  Future<List<Posts >> getPosts() async
  {
    var client = http.Client();
    var apiUri = Uri.parse("http://192.168.154.143:3001/api/post/viewall");
    var response = await client.get(apiUri);
    if(response.statusCode == 200)
    {
      var resp = response.body;
      return postsFromJson(resp);
    }
    else
    {
      return [];
    }
  }
}