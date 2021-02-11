import 'package:flutter/material.dart';
import '../../repositories/chat_repository.dart';

class LoginPage extends StatefulWidget {
  final ChatRepository chatRepository;

  const LoginPage({Key key, this.chatRepository}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState(this.chatRepository);
}

class _LoginPageState extends State<LoginPage> {
  final ChatRepository _chatRepository;
  TextEditingController nameController = TextEditingController();
  bool buttonEnabled = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _LoginPageState(this._chatRepository);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Bate papo Elo7'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Diga seu nome infeliz!!!',
                ),
                onChanged: (value) {
                  if (value?.isNotEmpty) {
                    setState(() {
                      buttonEnabled = true;
                    });
                  } else {
                    setState(() {
                      buttonEnabled = false;
                    });
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: buttonEnabled
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).disabledColor,
                child: FlatButton(
                  onPressed: buttonEnabled
                      ? () {
                          _registerLogin();
                        }
                      : null,
                  child: Text('Entrar'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _registerLogin() {
    _chatRepository.newUser(this.nameController.text).then((userRegistered) {
      Navigator.of(context)
          .pushReplacementNamed('/home', arguments: userRegistered);
    }, onError: (e) {
      _scaffoldKey.currentState.showSnackBar(
          SnackBar(content: Text("Falha ao tentar registrar usuário. ${e}")));
    });
  }
}
