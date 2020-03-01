
import 'package:rxdart/rxdart.dart';

class GameBl
{

  bool isWinner = false;

  var moveList = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
  var playerValue1 = "X";
  var playerValue2 = "O";

  var currentPlayer = "";

  BehaviorSubject<bool> _subjectWinner;
  BehaviorSubject<String> _subjectCurrentPlayer;
  BehaviorSubject<List<String>> _subjectMoveList;

  GameBl({this.isWinner, this.currentPlayer}){
    _subjectWinner = new BehaviorSubject<bool>.seeded(this.isWinner);
    _subjectCurrentPlayer = new BehaviorSubject<String>.seeded(this.currentPlayer);
    _subjectMoveList = new BehaviorSubject<List<String>>.seeded(this.moveList);
  }

  ValueStream<bool> get winnerObservable => _subjectWinner.stream;
  ValueStream<String> get currentPlayerObservable => _subjectCurrentPlayer.stream;
  ValueStream<List<String>> get moveListObservable => _subjectMoveList.stream;

  void initWinner(bool value){
    isWinner = value;
    _subjectWinner.sink.add(isWinner);
  }
  void setWinner(bool value){
    _subjectWinner.sink.add(value);
  }

  void initPlayer(String value){
    currentPlayer = value;
    _subjectCurrentPlayer.sink.add(currentPlayer);
  }
  void setPlayer(String value){
    _subjectCurrentPlayer.sink.add(value);
  }

  void setMoveList(List<String> value){
    _subjectMoveList.sink.add(value);
  }

  void dispose(){
    _subjectWinner.close();
  }
}