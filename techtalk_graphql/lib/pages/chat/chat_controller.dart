import 'package:hasura_connect/hasura_connect.dart';
import 'package:mobx/mobx.dart';
import 'package:techtalk_graphql/models/room_message_model.dart';
import 'package:techtalk_graphql/repositories/chat_repository.dart';

import '../../models/room_message_model.dart';
import '../../models/room_model.dart';
import '../../models/user_model.dart';
part 'chat_controller.g.dart';

class ChatController = _ChatControllerBase with _$ChatController;

abstract class _ChatControllerBase with Store {
  ChatRepository _chatRepository;

  @observable
  String message;

  @observable
  RoomModel roomModel;

  @observable
  UserModel userModel;

  @observable
  Snapshot<List<RoomMessageModel>> _snapshotRoomMessageModel;

  _ChatControllerBase(this._chatRepository);

  @action
  void setMessage(String value) => message = value;

  @action
  void setRoom(RoomModel value) => roomModel = value;

  @action
  void setUser(UserModel value) => userModel = value;

  @computed
  bool get canSendMessage => message?.isNotEmpty ?? false;

  Future getRoomMessages(int roomId) async {
    if (_snapshotRoomMessageModel != null) {
      _snapshotRoomMessageModel.close();
    }
    _snapshotRoomMessageModel =
        await _chatRepository.loadMessagesByRoom(roomId);
  }

  Future<void> sendMessage() async {
    await _chatRepository.sendMessage(RoomMessageModel(
      message: message,
      room: roomModel,
      user: userModel,
    ));
  }

  @computed
  ObservableStream<List<RoomMessageModel>> get messagesList =>
      _snapshotRoomMessageModel?.asObservable();

  dispose() {
    if (_snapshotRoomMessageModel != null) {
      _snapshotRoomMessageModel.close();
    }
  }
}
