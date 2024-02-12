import 'package:blog/post.dart';
import 'package:blog/register.dart';
import 'package:blog/service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email="";
  String password="";
  //String? userId;
  TextEditingController n1 = new TextEditingController();
  TextEditingController n2 = new TextEditingController();
  void SendApi() async
  {
    email = n1.text;
    password = n2.text;
    final response = await WelcomeApiService().logData(email,password);
    // final String objectId = response["_id"];
    // final String hexString = objectId.substring(10, 34);
    if(response != null && response["status"]=="success")
    {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>PostPage()));
    }
    else if(response != null && response["status"]=="Invalid user")
    {
      showSimplePopup1(context, "Invalid User!");
    }
    else
      {
        showSimplePopup2(context, "Invalid Password!");
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent.withOpacity(0.9),
    body: Container(
    padding: EdgeInsets.all(34),
    child: SingleChildScrollView(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    SizedBox(
    height: 135,
    ),
      CircleAvatar(
        radius: 50,
        child: Text("B",style: TextStyle(fontSize: 50)),
      ),
      SizedBox(
        height: 15,
      ),
    Text("Login",style: TextStyle(fontSize: 40)),
    SizedBox(
    height: 15,
    ),
    TextField(
    style: TextStyle(color: Colors.black),
    controller: n1,
    decoration: InputDecoration(
    labelText: "email",
    labelStyle: TextStyle(color: Colors.black),
    )
    ),
    SizedBox(
    height: 15,
    ),
    TextField(
      obscureText: true,
    style: TextStyle(color: Colors.black),
    controller: n2,
    decoration: InputDecoration(
    labelText: "password",
    labelStyle: TextStyle(color: Colors.black),
    ),
    ),
      SizedBox(
        height: 25,
      ),
      ElevatedButton(onPressed: SendApi, child: Text("Login")),
      SizedBox(
        height: 25,
      ),
      Text("Don't have account?",style: TextStyle(fontWeight: FontWeight.bold),),
      TextButton(onPressed: ()
          {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
          }, child: Text("Register",style: TextStyle(color: Colors.black),))
    ],
    ),
    ),
    ),
    );
  }

  void showSimplePopup1(BuildContext context, String s) {
    final snackBar = SnackBar(
      content: Text(s,style: TextStyle(color: Colors.redAccent),),
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.white70,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  void showSimplePopup2(BuildContext context, String s) {
    final snackBar = SnackBar(
      content: Text(s,style: TextStyle(color: Colors.redAccent),),
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.white70,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
