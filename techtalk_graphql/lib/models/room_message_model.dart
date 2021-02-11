import 'package:techtalk_graphql/models/room_model.dart';
import 'package:techtalk_graphql/models/user_model.dart';

class RoomMessageModel {
  final int id;
  final String message;
  final UserModel user;
  final RoomModel room;
  final DateTime registeredAt;

  RoomMessageModel(
      {this.id, this.message, this.user, this.room, this.registeredAt});

  factory RoomMessageModel.fromMap(Map<String, dynamic> map) =>
      RoomMessageModel(
        id: map['id'],
        message: map['message'] != null ? map['message'] : null,
        registeredAt: map['registered_at'] != null
            ? DateTime.parse(map['registered_at'])
            : null,
        room: RoomModel.fromMap(map['chat_room']),
        user: UserModel.fromMap(map['chat_user']),
      );
}
