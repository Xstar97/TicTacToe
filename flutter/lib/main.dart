import 'package:flutter/material.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [S.delegate],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateTitle: (BuildContext context) => S.of(context).title,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GamePage()
  ));
}
class GamePage extends StatefulWidget {

  @override
  _GamePageState createState() => _GamePageState();
}

const initMoveList = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
var moveList = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
var playerValue1 = "X";
var playerValue2 = "O";

var currentPlayer = playerValue1;

class _GamePageState extends State<GamePage> {

  bool validateWin(int index1, int index2, int index3, playerChar){
    return moveList[index1-1]+moveList[index2-1]+moveList[index3-1] == playerChar+playerChar+playerChar;
  }
  void dialogWinningMessage(BuildContext context, String playerChar){
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext alert) {
        return AlertDialog(
          title: Center(child: Text('Winner!'),),
          content: Text('Player: $playerChar',),
          actions: <Widget>[
            FlatButton(
              child: Text('restart game?'),
              onPressed: () {
                restartGame();
                Navigator.of(alert).pop();
              },
            ),
          ],
        );
      },
    );
  }
  void dialogMoveInUsedMessage(BuildContext context){
    showDialog<void>(
      context: context, // user must tap button!
      builder: (BuildContext alert) {
        return AlertDialog(
          title: Center(child: Text('Really?'),),
          content: Text('This option is unavailable :/'),
          actions: <Widget>[
            FlatButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(alert).pop();
              },
            ),
          ],
        );
      },
    );
  }
  void validateWinner(BuildContext context, String playerChar){
    if (validateWin(1, 2, 3, playerChar) ||
        validateWin(4, 5, 6, playerChar) ||
        validateWin(7, 8, 9, playerChar) ||
        validateWin(1, 4, 7, playerChar) ||
        validateWin(2, 5, 8, playerChar) ||
        validateWin(3, 6, 9, playerChar) ||
        validateWin(1, 5, 9, playerChar) ||
        validateWin(3, 5, 7, playerChar))
    {
      dialogWinningMessage(context, playerChar);
    }
  }
  void restartGame(){
    setState(() {
      moveList.replaceRange(0, moveList.length, initMoveList);
      currentPlayer = playerValue1;
    });
  }

  @override
  void initState() {
    super.initState();
  }
  void onItemSelected(String value) async{
    setState(() {
      if(!value.contains("X") && !value.contains("O")){
        validateWinner(context, currentPlayer,);
        moveList[int.parse(value)-1] = currentPlayer;
        validateWinner(context, currentPlayer);
        currentPlayer = currentPlayer == playerValue1 ? playerValue2 : playerValue1;
      } else{
        dialogMoveInUsedMessage(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget gridViewSelection = Container(
      width: 600,
      height: 600,
      child: GridView.count(
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
        crossAxisCount: 3,
        padding: const EdgeInsets.all(10),
        children: moveList.map((value) {
          return InkWell(
            onTap: () {
              onItemSelected(value);
            },
            child: Container(
              margin: const EdgeInsets.all(1.0),
              padding: const EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                  border: Border.all()), //       <--- BoxDecoration here
              child: Center(child: Visibility(
                visible: value.contains("X") || value.contains("O"),
                child: Text(value, style: TextStyle(fontSize: 50),),),),
            ), // Pass iconData and a boolean that specifies if the icon is selected or not
          );
        }).toList(), // Convert the map to a list of widgets
      ),);
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(child: Text(S.of(context).title, textAlign: TextAlign.center,),),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            gridViewSelection
          ],
        ),
      ),
    );
  }
}