import 'package:hasura_connect/hasura_connect.dart';
import 'package:techtalk_graphql/models/room_model.dart';
import 'package:techtalk_graphql/repositories/queries/chat_queries.dart';

class ChatRepository {
  final HasuraConnect _hasuraConnect;

  ChatRepository(this._hasuraConnect);

  Future<Snapshot<List<RoomModel>>> loadRooms() async {
    // ignore: close_sinks
    return this._hasuraConnect.subscription(loadRoomsQuery);
  }
}
