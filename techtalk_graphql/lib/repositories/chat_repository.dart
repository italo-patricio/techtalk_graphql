import 'package:techtalk_graphql/models/room_message_model.dart';
import 'package:techtalk_graphql/models/room_model.dart';
import 'package:techtalk_graphql/repositories/queries/chat_queries.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../models/room_model.dart';

class ChatRepository {
  HasuraConnect _hasuraConnect;

  ChatRepository(this._hasuraConnect);

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
}
