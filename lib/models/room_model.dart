class RoomModel {
  final int id;
  final String title;
  final String subTitle;
  final DateTime createdAt;

  RoomModel({this.id, this.title, this.subTitle, this.createdAt});

  factory RoomModel.fromMap(Map<String, dynamic> map) => RoomModel(
        id: map['id'],
        title: map['title'],
        subTitle: map['subtitle'],
        createdAt: DateTime(map['created_at']),
      );
}
