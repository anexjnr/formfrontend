import 'package:blog/service.dart';
import 'package:blog/servicepost.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  String post = "";
  TextEditingController n1 = new TextEditingController();

  void SendApi() async
  {
    post = n1.text;
    final response = await PostApiService().sendData(post);
    if (response["status"] == "success") {
      showSimplePopup1(context, "New Post Added!");
    }
    else {
      print("Error");
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
                height: 75,
              ),
              Text("New Post", style: TextStyle(fontSize: 40)),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 300,
                width: 300,
                child: TextField(
                    style: TextStyle(color: Colors.black),
                    controller: n1,
                    decoration: InputDecoration(
                      labelText: "enter the message",
                      labelStyle: TextStyle(color: Colors.black),
                    )
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(onPressed: SendApi, child: Text("Post Now")),
            ],
          ),
        ),
      ),
    );
  }

  void showSimplePopup1(BuildContext context, String s) {
    final snackBar = SnackBar(
      content: Text(s, style: TextStyle(color: Colors.black),),
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.white70,
    );
  }
}
