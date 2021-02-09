import 'package:flutter/material.dart';
import 'package:techtalk_graphql/pages/home/home_controller.dart';
import 'package:techtalk_graphql/repositories/chat_repository.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bate papo Elo7'),
      ),
      body: FutureBuilder<Object>(
          // stream: null,
          builder: (context, snapshot) {
        return Container(
          child: ListView.builder(
              itemCount: 2,
              itemBuilder: (_, index) {
                return ListTile(
                  title: Text('Sala-$index'),
                  subtitle: Text('Aqui é tudo livre...'),
                  trailing: IconButton(
                      icon: Icon(Icons.arrow_right_sharp), onPressed: null),
                );
              }),
        );
      }),
    );
  }
}
