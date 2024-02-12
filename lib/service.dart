import 'dart:convert';
import 'package:http/http.dart' as http;

class WelcomeApiService
{
  Future<dynamic> sendData(
      String name,String age,String mobileno,String pincode,String email,String password
      ) async
  {
    var client = http.Client();
    var apiUri = Uri.parse("http://192.168.154.143:3001/api/signin/add");
    var response = await client.post(apiUri,
      headers: <String,String>
      {
        "Content-Type":"application/json; charset=UTF-8"
      },
      body: jsonEncode(<String,String>
      {"name" : name,
        "age" : age,
        "mobileno" : mobileno,
        "pincode" : pincode,
        "email" : email,
        "password" : password
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

  Future<dynamic> logData(
      String email,String password
      ) async
  {
    var client = http.Client();
    var apiUri = Uri.parse("http://192.168.154.143:3001/api/signin/signin");
    var response = await client.post(apiUri,
      headers: <String,String>
      {
        "Content-Type":"application/json; charset=UTF-8"
      },
      body: jsonEncode(<String,String>
      {
        "email" : email,
        "password" : password
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
}