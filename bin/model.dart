class Board{
  final int size;
  final _emptyPlace;

  final List<List<Player>> _places;

  Board(this.size, [this._emptyPlace]):
      _places = List.generate(size, (i) => List.filled(size, _emptyPlace),growable: false);

  List<Player> row(int i) =>  _places[i];
  List<List<Player>> get rows => _places;


  isEmptyPlace(int x, int y){
    return false;
  }
}
class Player{
  final String stone;
  Player(this.stone);
  @override
  String toString() => stone;
}