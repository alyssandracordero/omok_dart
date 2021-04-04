import 'consoleUI.dart';
import 'web_client.dart';
//Alyssandra M. Cordero
//manager class. processes data from the user
class controller {
  void start() async {
    var ui = consoleUI(); //reference to UI

    ui.showMessage('Welcome to Omok Game!');
    var server = ui.promptServer(web_client.DEFAULT_SERVER); //default url
    //establish the connection
    ui.showMessage('Obtaining server information...');
    var web = web_client(server); //reference to web_client
    var info = await web.getInfo();
    //show result of strategy
    var strategy = ui.promptStrategy(info.strategies);
    ui.showMessage('Creating game...\n');
    //ui.showBoard();

    var defaultBoardSize = 15; //testing
    var move = ui.promptMove(defaultBoardSize);
  }
}
