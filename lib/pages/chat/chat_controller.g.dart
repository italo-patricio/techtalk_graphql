// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatController on _ChatControllerBase, Store {
  Computed<ObservableStream<List<RoomMessageModel>>> _$messagesListComputed;

  @override
  ObservableStream<List<RoomMessageModel>> get messagesList =>
      (_$messagesListComputed ??=
              Computed<ObservableStream<List<RoomMessageModel>>>(
                  () => super.messagesList,
                  name: '_ChatControllerBase.messagesList'))
          .value;

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

  @override
  String toString() {
    return '''
messagesList: ${messagesList}
    ''';
  }
}
