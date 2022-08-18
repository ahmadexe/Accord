class UserModel {
  String? id;
  String name;
  String email;
  String password;
  List? groups;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    this.groups,
  });

  fromJson(Map<String, dynamic> json) {
    UserModel user = UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        password: json['password'],
        groups: json['groups']);
    return user;
  }

  toJson(UserModel UserModel) {
    Map<String, dynamic> json = {
      'id': UserModel.id,
      'name': UserModel.name,
      'email': UserModel.email,
      'password': UserModel.password,
      'groups': UserModel.groups,
    };
    return json;
  }
}
