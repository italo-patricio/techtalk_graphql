import 'package:mobx/mobx.dart';
import 'package:techtalk_graphql/models/room_model.dart';
import 'package:techtalk_graphql/repositories/chat_repository.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  ChatRepository _chatRepository;

  @observable
  List<RoomModel> _snapshotRoomModel;

  _HomeControllerBase(this._chatRepository);

  Future getRooms() async {
    // if (_snapshotRoomModel != null) {
    //   _snapshotRoomModel.close();
    // }
    _snapshotRoomModel = await _chatRepository.loadRooms();
  }

  @computed
  ObservableList<RoomModel> get roomList => _snapshotRoomModel?.asObservable();

  dispose() {
    // if (_snapshotRoomModel != null) {
    //   _snapshotRoomModel.close();
    // }
  }
}
