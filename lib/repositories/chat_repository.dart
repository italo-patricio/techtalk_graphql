import 'package:hasura_connect/hasura_connect.dart';
import 'package:techtalk_graphql/core/hasura_client.dart';
import 'package:techtalk_graphql/models/room_model.dart';
import 'package:techtalk_graphql/repositories/queries/chat_queries.dart';

class ChatRepository {
  final HasuraConnect _hasuraConnect;

  ChatRepository(this._hasuraConnect);

  Future<Snapshot<List<RoomModel>>> loadRooms() async {
    var snapshot = await this._hasuraConnect.subscription(loadRoomsQuery);

    return snapshot.map((result) {
      if (result == null) {
        return null;
      }
      return (result['data'] as List).map((e) => RoomModel.fromMap(e));
    });
  }
}
