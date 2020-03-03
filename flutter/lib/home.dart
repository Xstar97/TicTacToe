
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'game.dart';
import 'generated/l10n.dart';

bool isMobile = false;
const ASSETS_ICONS = "resources/icons/";

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
    isMobile = !kIsWeb;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    Widget _icon(String name){
      return Image(image: AssetImage("$ASSETS_ICONS$name"), width: 48, height: 48,);
    }

    Widget gridItem(Widget item, Color colors){
      return Container(
        margin: const EdgeInsets.all(1.0),
        padding: const EdgeInsets.all(1.0),
        decoration: BoxDecoration(
          color: colors,
            border: Border.all()),
        child: Center(child: item,),
      );
    }
    Widget empty = gridItem(Text("", style: TextStyle(fontSize: 50)), null);

    Widget mobilePlayStore = InkWell(
      child: gridItem(_icon("play_store.png"), Colors.grey),
      onTap: null,
    );
    Widget mobileAppStore = InkWell(
      child: gridItem(_icon("app_store.png"), Colors.grey),
      onTap: null,
    );
    Widget mobileExit = InkWell(
      onTap: ()=> SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
      child: gridItem(Text(S.of(context).gameActionExit, textAlign: TextAlign.center, style: TextStyle(fontSize: 20)), null),
    );

    Widget gameModeMulti = InkWell(
      onTap: null,
      child: gridItem(Text(S.of(context).gameModeMulti, textAlign: TextAlign.center, style: TextStyle(fontSize: 20)), Colors.grey),
    );
    Widget gameModeLocal = InkWell(
      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => GamePageLocal())),
      child: gridItem(Text(S.of(context).gameModeLocal, textAlign: TextAlign.center, style: TextStyle(fontSize: 20)), null),
    );

    Widget grid = Container(
      width: 600,
      height: 600,
      child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          padding: const EdgeInsets.all(4.0),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          children: <Widget>[
            empty,
            gameModeMulti,
            empty,
            empty,
            gameModeLocal,
            empty,
            isMobile ? empty : mobilePlayStore,
            isMobile ? mobileExit : empty,
            isMobile ? empty : mobileAppStore,
          ].map((Widget widget) {
            return GridTile(
                child: widget);
          }).toList()),
    );

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(child: Text(S.of(context).title, textAlign: TextAlign.center,),),
      ),
      body: Center(
        child: grid,
      ),
    );
  }
}