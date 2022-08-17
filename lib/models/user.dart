class User {
  String? id;
  String name;
  String email;
  String password;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  fromJson(Map<String, dynamic> json) {
    User user = User(id: json['id'], name: json['name'], email: json['email'], password: json['password']);
    return user;
  }

  toJson(User user) {
    Map<String, dynamic> json = {
      'id': user.id,
      'name': user.name,
      'email': user.email,
      'password': user.password,
    };
    return json;
  }
}