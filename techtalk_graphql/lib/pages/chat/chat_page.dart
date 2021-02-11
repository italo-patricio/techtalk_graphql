import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:techtalk_graphql/pages/chat/chat_controller.dart';

import '../../models/room_model.dart';
import '../../models/room_model.dart';
import '../../models/user_model.dart';

class ChatPage extends StatefulWidget {
  final ChatController chatController;

  const ChatPage({Key key, this.chatController}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState(this.chatController);
}

class _ChatPageState extends State<ChatPage> {
  ChatController _chatController;
  RoomModel _roomModel;
  UserModel _userModel;

  _ChatPageState(this._chatController);

  @override
  void initState() {
    super.initState();
  }

  _initAWait() async {
    Future.delayed(Duration.zero, () {
      this._chatController.getRoomMessages(_roomModel.id);
    });
  }

  @override
  void dispose() {
    _chatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    _roomModel = args['roomModel'];
    _userModel = args['userModel'];

    _initAWait();
    return Scaffold(
      appBar: AppBar(
        title: Text('${_roomModel?.title}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Observer(builder: (_) {
                if (_chatController?.messagesList?.hasError ?? false) {
                  return Center(
                    child: Text(
                        'Ocorreu um erro ao realizar a requisição. Error: ${_chatController.messagesList.error}'),
                  );
                }

                if (_chatController?.messagesList?.value == null) {
                  return Center(child: CircularProgressIndicator());
                }

                if (_chatController?.messagesList?.value?.isEmpty ?? true) {
                  return Center(child: Text('Nada para exibir'));
                }

                return ListView.builder(
                    reverse: true,
                    itemCount: _chatController?.messagesList?.value?.length,
                    itemBuilder: (_, index) {
                      final item = _chatController?.messagesList?.value[index];

                      return ListTile(
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(40)),
                          child: Hero(
                            tag: '$index',
                            child: Icon(Icons.person),
                          ),
                        ),
                        title: Text('${item.user.login}'),
                        subtitle: Text('${item.message}'),
                      );
                    });
              }),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 40),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.send),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
