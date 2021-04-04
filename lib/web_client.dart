import 'response_parser.dart';
import 'package:http/http.dart' as http;

class web_client {
  static const DEFAULT_SERVER = 'http://www.cs.utep.edu/cheon/cs3360/project/omok/info';

//make a connection to obtain server info
  final _server;
  final _parser = response_parser();

  web_client(this._server);

//getInfo method returns the board size and the server strategy/strategies
  getInfo() async {
    var response;
    response = await http.get(Uri.parse(DEFAULT_SERVER));
//making connection to the info API
//pass JSON FROM ANOTHER CLASS IN THIS CASE RESPONSEPARSER

    //return Info(15, <String>['Smart','Random']);

    return _parser.parseInfo(response);
  }
}
