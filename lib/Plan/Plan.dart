import 'package:flutter/cupertino.dart';
import 'package:flutter_app/User/User.dart';


class Plan {
  var id;
  String title;
  String description;
  String date;
  User author;
  List<User> invited;

  Plan(
      {this.id,
        this.title,
        this.description,
        this.date,
        this.author,
        @required  this.invited });

  Plan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    date = json['date'];
    author =
    json['author'] != null ? new User.fromJson(json['author']) : null;
    if (json['invited'] != null) {
      invited = new List<User>();
      json['invited'].forEach((v) {
        invited.add(new User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['date'] = this.date;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    if (this.invited != null) {
      data['invited'] = this.invited.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Plan{id: $id, title: $title, author: $author}';
  }
}
