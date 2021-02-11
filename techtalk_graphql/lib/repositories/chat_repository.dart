import 'package:techtalk_graphql/models/room_message_model.dart';
import 'package:techtalk_graphql/models/room_model.dart';
import 'package:techtalk_graphql/repositories/queries/chat_queries.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../core/hasura_client.dart';
import '../models/room_message_model.dart';
import '../models/room_model.dart';
import '../models/user_model.dart';

class ChatRepository {
  HasuraConnect _hasuraConnect;

  // ignore: unused_element
  ChatRepository._contructor(this._hasuraConnect);

  static ChatRepository _instance;

  ChatRepository.initialize() {
    this._hasuraConnect = HasuraClient.connect;
    print('criando nova instancia para ChatRepository');
  }

  static ChatRepository get instance =>
      _instance ??= ChatRepository.initialize();

  Future<List<RoomModel>> loadRooms() async {
    // ignore: close_sinks
    try {
      final data = await _hasuraConnect.query(loadRoomsQuery);

      return (data['data']['chat_room'] as List)
          .map((e) => RoomModel.fromMap(e))
          .toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<Snapshot<List<RoomMessageModel>>> loadMessagesByRoom(
      int roomId) async {
    Snapshot _snapshot;
    try {
      _snapshot = await _hasuraConnect
          .subscription(loadRoomMessagesQuery, variables: {'roomId': roomId});

      return _snapshot.map((data) {
        if (data == null) {
          return null;
        }

        return (data['data']['chat_room_message'] as List)
            .map((e) => RoomMessageModel.fromMap(e))
            .toList();
      });
    } catch (e) {
      print(e);
      return _snapshot;
    }
  }

  Future<UserModel> newUser(String name) async {
    try {
      final result = await _hasuraConnect
          .mutation(newUserMutation, variables: {'name': name});
      return UserModel.fromMap(
          result['data']['insert_chat_user']['returning'][0]);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> sendMessage(RoomMessageModel messageModel) async {
    try {
      final result =
          await _hasuraConnect.mutation(sendMessageMutation, variables: {
        'roomId': messageModel.room.id,
        'userId': messageModel.user.id,
        'message': '${messageModel.message}',
      });
      return result['data']['insert_chat_room_message']['affected_rows'] > 0;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
