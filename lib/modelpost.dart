// To parse this JSON data, do
//
//     final posts = postsFromJson(jsonString);

import 'dart:convert';

List<Posts> postsFromJson(String str) => List<Posts>.from(json.decode(str).map((x) => Posts.fromJson(x)));

String postsToJson(List<Posts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Posts {
  String userId;
  String post;

  Posts({
    required this.userId,
    required this.post,
  });

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
    userId: json["userId"],
    post: json["post"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "post": post,
  };
}
