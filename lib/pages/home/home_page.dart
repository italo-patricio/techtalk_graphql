import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:techtalk_graphql/pages/home/home_controller.dart';

class HomePage extends StatefulWidget {
  final HomeController homeController;

  const HomePage({Key key, @required this.homeController}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState(this.homeController);
}

class _HomePageState extends State<HomePage> {
  HomeController _homeController;

  _HomePageState(this._homeController);

  @override
  void initState() {
    _homeController.getRooms();
    super.initState();
  }

  @override
  void dispose() {
    _homeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bate papo Elo7'),
      ),
      body: StreamBuilder<Object>(
          stream: _homeController.roomList,
          builder: (context, snapshot) {
            if (_homeController.roomList?.hasError ?? false) {
              return Center(
                child: Text('Ocorreu um erro ao realizar a requisição'),
              );
            }

            if (snapshot?.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (_homeController?.roomList?.value == null &&
                snapshot?.connectionState == ConnectionState.done) {
              return Center(child: Text('Nada para exibir'));
            }

            if (snapshot.data == null)
              return Container(
                  child: ListView.builder(
                      itemCount: _homeController?.roomList?.value?.length,
                      itemBuilder: (_, index) {
                        final item = _homeController?.roomList?.value[index];
                        return ListTile(
                          title: Text('${item.title}'),
                          subtitle: Text('Aqui é tudo livre...'),
                          trailing: IconButton(
                              icon: Icon(Icons.arrow_right_sharp),
                              onPressed: null),
                        );
                      }));
          }),
    );
  }
}
