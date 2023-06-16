import 'dart:convert';

List<User> getUserList(String str) => List<User>.from(
      json.decode(str).map(
            (x) => User.fromJson(x),
          ),
    );

String userToJson(List<User> data) => json.encode(
      List<dynamic>.from(
        data.map(
          (x) => x.toJson(),
        ),
      ),
    );

class User {
  String? id;
  String? name;
  String? email;
  String? mobile;
  String? password;

  User({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobile": mobile,
        "password": password,
      };
}
