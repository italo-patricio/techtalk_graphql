import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:techtalk_graphql/models/room_model.dart';
import 'package:techtalk_graphql/pages/home/home_controller.dart';

import '../../models/user_model.dart';

class HomePage extends StatefulWidget {
  final HomeController homeController;

  const HomePage({Key key, @required this.homeController}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState(this.homeController);
}

class _HomePageState extends State<HomePage> {
  HomeController _homeController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  _HomePageState(this._homeController);

  UserModel userModel;

  ReactionDisposer disposer;

  @override
  void initState() {
    _homeController.getRooms();
    super.initState();

    disposer = reaction((_) => _homeController.userModel, (_) {
      scaffoldKey.currentState.showSnackBar(
          SnackBar(content: Text("Bem vindo ${userModel?.login}")));
    });
  }

  @override
  void dispose() {
    _homeController.dispose();
    disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    this.userModel = ModalRoute.of(context).settings.arguments;

    _homeController.setUser(userModel);

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Bate papo Elo7'),
        actions: [
          IconButton(
              icon: Icon(Icons.replay_outlined),
              onPressed: () {
                _homeController.getRooms();
              })
        ],
      ),
      body: Observer(builder: (_) {
        // if (_homeController.roomList?.hasError ?? false) {
        //   return Center(
        //     child: Text('Ocorreu um erro ao realizar a requisição'),
        //   );
        // }

        if (_homeController?.roomList == null) {
          return Center(child: CircularProgressIndicator());
        }

        if (_homeController?.roomList?.isEmpty ?? true) {
          return Center(child: Text('Nada para exibir'));
        }

        return Container(
            child: ListView.builder(
                itemCount: _homeController?.roomList?.length,
                itemBuilder: (_, index) {
                  final item = _homeController?.roomList[index];
                  return ListTile(
                    title: Text('${item.title}'),
                    subtitle: Text('Aqui é tudo livre...'),
                    trailing: IconButton(
                        icon: Icon(Icons.arrow_right_sharp),
                        onPressed: () {
                          _navigateToChat(item);
                        }),
                    onTap: () {
                      _navigateToChat(item);
                    },
                  );
                }));
      }),
    );
  }

  _navigateToChat(RoomModel roomModel) {
    Navigator.of(context).pushNamed('/chat',
        arguments: {'roomModel': roomModel, 'userModel': userModel});
  }
}
