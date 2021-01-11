class User {
  String login;
  String avatarUrl;
  String name;

  User({login, avatarUrl, name});

  User.fromJson(Map<String, dynamic> json) {
    this.login = json['login'];
    this.avatarUrl = json['avatar_url'];
    this.name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['avatar_url'] = this.avatarUrl;
    data['name'] = this.name;
    return data;
  }
}
