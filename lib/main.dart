import 'package:flutter/material.dart';
import 'package:techtalk_graphql/core/hasura_client.dart';
import 'package:techtalk_graphql/pages/chat/chat_page.dart';
import 'package:techtalk_graphql/pages/home/home_controller.dart';
import 'package:techtalk_graphql/pages/home/home_page.dart';
import 'package:techtalk_graphql/pages/login/login_page.dart';
import 'package:techtalk_graphql/repositories/chat_repository.dart';

const URL_BASE = 'http://localhost:8080/v1/graphql';

void main() {
  HasuraClient.initialize(urBase: URL_BASE);
  runApp(MainGraphQLApp());
}

class MainGraphQLApp extends StatelessWidget {
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
        '/': (_) => LoginPage(),
        '/home': (_) => HomePage(
              homeController: HomeController(
                  ChatRepository(HasuraClient.instance.hasuraConnect)),
            ),
        '/chat': (_) => ChatPage(),
      },
    );
  }
}
