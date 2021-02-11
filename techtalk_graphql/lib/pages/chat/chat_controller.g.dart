// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatController on _ChatControllerBase, Store {
  Computed<bool> _$canSendMessageComputed;

  @override
  bool get canSendMessage =>
      (_$canSendMessageComputed ??= Computed<bool>(() => super.canSendMessage,
              name: '_ChatControllerBase.canSendMessage'))
          .value;
  Computed<ObservableStream<List<RoomMessageModel>>> _$messagesListComputed;

  @override
  ObservableStream<List<RoomMessageModel>> get messagesList =>
      (_$messagesListComputed ??=
              Computed<ObservableStream<List<RoomMessageModel>>>(
                  () => super.messagesList,
                  name: '_ChatControllerBase.messagesList'))
          .value;

  final _$messageAtom = Atom(name: '_ChatControllerBase.message');

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  final _$roomModelAtom = Atom(name: '_ChatControllerBase.roomModel');

  @override
  RoomModel get roomModel {
    _$roomModelAtom.reportRead();
    return super.roomModel;
  }

  @override
  set roomModel(RoomModel value) {
    _$roomModelAtom.reportWrite(value, super.roomModel, () {
      super.roomModel = value;
    });
  }

  final _$userModelAtom = Atom(name: '_ChatControllerBase.userModel');

  @override
  UserModel get userModel {
    _$userModelAtom.reportRead();
    return super.userModel;
  }

  @override
  set userModel(UserModel value) {
    _$userModelAtom.reportWrite(value, super.userModel, () {
      super.userModel = value;
    });
  }

  final _$_snapshotRoomMessageModelAtom =
      Atom(name: '_ChatControllerBase._snapshotRoomMessageModel');

  @override
  Snapshot<List<RoomMessageModel>> get _snapshotRoomMessageModel {
    _$_snapshotRoomMessageModelAtom.reportRead();
    return super._snapshotRoomMessageModel;
  }

  @override
  set _snapshotRoomMessageModel(Snapshot<List<RoomMessageModel>> value) {
    _$_snapshotRoomMessageModelAtom
        .reportWrite(value, super._snapshotRoomMessageModel, () {
      super._snapshotRoomMessageModel = value;
    });
  }

  final _$_ChatControllerBaseActionController =
      ActionController(name: '_ChatControllerBase');

  @override
  void setMessage(String value) {
    final _$actionInfo = _$_ChatControllerBaseActionController.startAction(
        name: '_ChatControllerBase.setMessage');
    try {
      return super.setMessage(value);
    } finally {
      _$_ChatControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRoom(RoomModel value) {
    final _$actionInfo = _$_ChatControllerBaseActionController.startAction(
        name: '_ChatControllerBase.setRoom');
    try {
      return super.setRoom(value);
    } finally {
      _$_ChatControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUser(UserModel value) {
    final _$actionInfo = _$_ChatControllerBaseActionController.startAction(
        name: '_ChatControllerBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_ChatControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
message: ${message},
roomModel: ${roomModel},
userModel: ${userModel},
canSendMessage: ${canSendMessage},
messagesList: ${messagesList}
    ''';
  }
}
