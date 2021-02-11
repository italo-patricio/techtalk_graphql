class UserModel {
  final int id;
  final String login;
  final DateTime createdAt;
  final bool online;

  UserModel({this.id, this.login, this.createdAt, this.online});

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        id: map['id'],
        login: map['login'],
        createdAt: map['created_at'] != null
            ? DateTime.parse(map['created_at'])
            : null,
        online: map['online'],
      );
}
