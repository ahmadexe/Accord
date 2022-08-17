class UserModel {
  String? id;
  String name;
  String email;
  String password;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  fromJson(Map<String, dynamic> json) {
    UserModel user = UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        password: json['password']);
    return user;
  }

  toJson(UserModel UserModel) {
    Map<String, dynamic> json = {
      'id': UserModel.id,
      'name': UserModel.name,
      'email': UserModel.email,
      'password': UserModel.password,
    };
    return json;
  }
}
