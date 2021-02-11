import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:mobx/mobx.dart';
import 'package:techtalk_graphql/models/room_message_model.dart';
import 'package:techtalk_graphql/repositories/chat_repository.dart';
part 'chat_controller.g.dart';

class ChatController = _ChatControllerBase with _$ChatController;

abstract class _ChatControllerBase with Store {
  ChatRepository _chatRepository;

  @observable
  Snapshot<List<RoomMessageModel>> _snapshotRoomMessageModel;

  _ChatControllerBase(this._chatRepository);

  Future getRoomMessages(int roomId) async {
    if (_snapshotRoomMessageModel != null) {
      _snapshotRoomMessageModel.close();
    }
    _snapshotRoomMessageModel =
        await _chatRepository.loadMessagesByRoom(roomId);
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
