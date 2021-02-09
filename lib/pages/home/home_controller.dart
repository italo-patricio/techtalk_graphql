import 'package:mobx/mobx.dart';
import 'package:techtalk_graphql/core/hasura_client.dart';
import 'package:techtalk_graphql/models/room_model.dart';
import 'package:techtalk_graphql/repositories/chat_repository.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  ChatRepository _chatRepository;

  @observable
  Future<List<RoomModel>> _roomModelFuture;

  _HomeControllerBase(this._chatRepository) {
    // _chatRepository.loa
  }
}
