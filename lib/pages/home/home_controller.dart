import 'package:hasura_connect/hasura_connect.dart';
import 'package:mobx/mobx.dart';
import 'package:techtalk_graphql/models/room_model.dart';
import 'package:techtalk_graphql/repositories/chat_repository.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  ChatRepository _chatRepository;

  @observable
  Snapshot<List<RoomModel>> _snapshotRoomModel;

  _HomeControllerBase(this._chatRepository) {
    getRooms();
  }

  Future getRooms() async {
    _snapshotRoomModel = await _chatRepository.loadRooms();
  }

  @computed
  ObservableStream<List<RoomModel>> get roomList =>
      _snapshotRoomModel?.asObservable();

  dispose() {
    if (_snapshotRoomModel != null) {
      _snapshotRoomModel.close();
    }
  }
}
