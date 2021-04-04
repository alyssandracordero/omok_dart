import 'dart:convert';

class response_parser {
//parse JSON create info and return
//response_parser();

  parseInfo(response) {
    var info = json.decode(response.body);
    var size = info['size'];
    var strategies = info['strategies'];
    return Info(size, strategies);
  }
}
//this class must take JSON, must check user input and must return a
//data structure with the JSON information otherwise must trow an exception.
class Info {
  final size;
  final strategies;

  Info(this.size, this.strategies);
}
