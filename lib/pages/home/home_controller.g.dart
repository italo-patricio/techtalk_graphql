// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<ObservableStream<List<RoomModel>>> _$roomListComputed;

  @override
  ObservableStream<List<RoomModel>> get roomList => (_$roomListComputed ??=
          Computed<ObservableStream<List<RoomModel>>>(() => super.roomList,
              name: '_HomeControllerBase.roomList'))
      .value;

  final _$_snapshotRoomModelAtom =
      Atom(name: '_HomeControllerBase._snapshotRoomModel');

  @override
  Snapshot<List<RoomModel>> get _snapshotRoomModel {
    _$_snapshotRoomModelAtom.reportRead();
    return super._snapshotRoomModel;
  }

  @override
  set _snapshotRoomModel(Snapshot<List<RoomModel>> value) {
    _$_snapshotRoomModelAtom.reportWrite(value, super._snapshotRoomModel, () {
      super._snapshotRoomModel = value;
    });
  }

  @override
  String toString() {
    return '''
roomList: ${roomList}
    ''';
  }
}
