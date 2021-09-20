class User {
  String username;
  String profilePic;

  User({this.username, this.profilePic});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    profilePic = json['profilePic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['profilePic'] = this.profilePic;

    return data;
  }
}
