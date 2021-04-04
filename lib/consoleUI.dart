import 'dart:io';
import 'web_client.dart';
//Alyssandra M. Cordero
//Class shows input to the user
class consoleUI {
  //method used to show output to the user.
  void showMessage(msg) {
    stdout.writeln(msg);
  }//END of showMessage()

  //method used to show the select server implementation to the user.
  promptServer(defaultUrl) async {
    while (true) {
      //variables
      showMessage('Enter the server URL [default: $defaultUrl]');
      var web = web_client(defaultUrl);
      var url;
      var response = stdin.readLineSync();
      //check input:
      if (response.isEmpty) {
        showMessage('Default server was given: $defaultUrl');
        url = defaultUrl;
        return url;
      }
      if (Uri.parse(response).isAbsolute) {
        url = response;
        return url;
      }
      showMessage('Invalid URL: $response');
    }
  }//END of promptServer()

  //method used to show the select a strategy implementation to the user.
  promptStrategy(strategies) {
    var strategy;
    while (true) {
      showMessage('\nSelect server strategy: ');
      for (var i = 0; i < strategies.length; i++) {
        stdout.write('${i + 1}. ${strategies[i]} ');
      }
      showMessage('[default: 1]');
      var inputStrategy = stdin.readLineSync();
      if (inputStrategy.isEmpty) {
        strategy = strategies[0].toString();
        showMessage('Default strategy was given: $strategy');
        break;
      }
      try {
        var selection = int.parse(inputStrategy);
        if (selection >= 1 && selection <= strategies.length) {
          return strategies[selection - 1];
        }
      } on FormatException {
        showMessage('Invalid Strategy: $inputStrategy');
      }
    }
  }//END of promptStrategy()

  //method used to show the select move implementation to the user.
  promptMove(boardSize) {
    while (true) {
      showMessage('Enter x and y (1- $boardSize, separated with a comma): ');
      var inputCoordinate = stdin.readLineSync();
      try {
        var coordinate = _parseXY(inputCoordinate);
        //check if the place is empty
        if (inputCoordinate.isEmpty) {
          showMessage('Invalid Coordinate $inputCoordinate: ');
          continue;
        } else {
          return coordinate;
        }
      } on FormatException {}
      showMessage('Invalid coordinate $inputCoordinate: ');
    }
  }//END of promptMove()

  //method used as a helper method to the promptMove() to check the properties from user input.
  Coordinate _parseXY(userCoordinate) {
    //split coordinates
    var tokenize = userCoordinate.split(RegExp(r' *[,]*'));
    //creating a dummy variable for the coordinates
    var coordinates = <int>[];
    //check the coordinates length
    if (tokenize.length != 2) {
      throw FormatException();
    }
    //check the coordinates dimension
    for (var str in tokenize) {
      var coordinate = int.parse(str); //dummy coordinate for comparison
      if (coordinate >= 1 && coordinate <= 15) {
        coordinates.add(coordinate - 1);
      } else {
        throw FormatException();
      }
    }
    return Coordinate(coordinates[0], coordinates[1]);
  }//END of _parseXY()
}//END OF CONSOLEUI CLASS

//class to establish coordinate object.
class Coordinate {
  final int x;
  final int y;

  Coordinate(this.x, this.y);
}//END OF COORDINATE CLASS
