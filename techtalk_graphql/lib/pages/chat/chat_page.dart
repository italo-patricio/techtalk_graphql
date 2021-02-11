import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:techtalk_graphql/pages/chat/chat_controller.dart';

import '../../models/room_model.dart';
import '../../models/room_model.dart';

class ChatPage extends StatefulWidget {
  final ChatController chatController;

  const ChatPage({Key key, this.chatController}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState(this.chatController);
}

class _ChatPageState extends State<ChatPage> {
  ChatController _chatController;

  _ChatPageState(this._chatController);

  @override
  void initState() {
    super.initState();
  }

  _initAWait() async {
    await _chatController.getRoomMessages(1);
  }

  @override
  void dispose() {
    _chatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final RoomModel args = ModalRoute.of(context).settings.arguments;
    this._chatController.getRoomMessages(args.id);

    return Scaffold(
      appBar: AppBar(
        title: Text('${args.title}'),
      ),
      body: Container(
        child: Observer(builder: (_) {
          // if (snapshot.hasError) {
          //   return Center(
          //     child: Text('Ocorreu um erro ao realizar a requisição'),
          //   );
          // }
          // if (snapshot.connectionState != ConnectionState.done) {
          //   return Center(child: CircularProgressIndicator());
          // }
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
    );
  }
}
