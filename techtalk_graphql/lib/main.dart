import 'package:flutter/material.dart';
import 'package:techtalk_graphql/core/hasura_client.dart';
import 'package:techtalk_graphql/pages/chat/chat_controller.dart';
import 'package:techtalk_graphql/pages/chat/chat_page.dart';
import 'package:techtalk_graphql/pages/home/home_controller.dart';
import 'package:techtalk_graphql/pages/home/home_page.dart';
import 'package:techtalk_graphql/pages/login/login_page.dart';
import 'package:techtalk_graphql/repositories/chat_repository.dart';

import 'repositories/chat_repository.dart';

const URL_BASE = 'https://techtalk-graphql.herokuapp.com/v1/graphql';

void main() {
  HasuraClient.initialize(urBase: URL_BASE);
  ChatRepository.initialize();
  runApp(MainGraphQLApp());
}

class MainGraphQLApp extends StatelessWidget {
  final _chatRepository = ChatRepository.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechTalk GraphQL',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => LoginPage(
              chatRepository: _chatRepository,
            ),
        '/home': (_) => HomePage(
              homeController: HomeController(_chatRepository),
            ),
        '/chat': (_) => ChatPage(
              chatController: ChatController(_chatRepository),
            )
      },
    );
  }
}
