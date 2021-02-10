import 'package:hasura_connect/hasura_connect.dart';

class HasuraClient {
  HasuraConnect hasuraConnect;
  final String urlBase;

  static HasuraClient _instance;
  factory HasuraClient.initialize({String urBase = ''}) {
    _instance ??= HasuraClient._constructor(urBase);
    return _instance;
  }

  HasuraClient._constructor(this.urlBase) {
    this.hasuraConnect = HasuraConnect(urlBase);
  }

  static HasuraClient get instance => _instance ??= HasuraClient.initialize();

  static HasuraConnect get connect =>
      _instance.hasuraConnect ??= HasuraClient.initialize().hasuraConnect;
}
