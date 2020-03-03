// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

class S {
  S(this.localeName);
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return S(localeName);
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  final String localeName;

  String get title {
    return Intl.message(
      'TicTacToe',
      name: 'title',
      desc: 'Name of the app',
      args: [],
    );
  }

  String leaderBoardPlayer(dynamic name, dynamic count) {
    return Intl.message(
      'player $name: $count',
      name: 'leaderBoardPlayer',
      desc: 'current player\'s winning count',
      args: [name, count],
    );
  }

  String leaderBoardPlayerTie(dynamic count) {
    return Intl.message(
      'tie: $count',
      name: 'leaderBoardPlayerTie',
      desc: 'tie count',
      args: [count],
    );
  }

  String get gameModeMulti {
    return Intl.message(
      'multi-player',
      name: 'gameModeMulti',
      desc: 'start a game online',
      args: [],
    );
  }

  String get gameModeLocal {
    return Intl.message(
      'Local: offline',
      name: 'gameModeLocal',
      desc: 'peer to peer game',
      args: [],
    );
  }

  String get gameActionExit {
    return Intl.message(
      'Exit Game',
      name: 'gameActionExit',
      desc: 'close game',
      args: [],
    );
  }

  String get gameMessageOverTitle {
    return Intl.message(
      'Game Over!',
      name: 'gameMessageOverTitle',
      desc: 'game finished',
      args: [],
    );
  }

  String get gameMessageReallyTitle {
    return Intl.message(
      'Really?',
      name: 'gameMessageReallyTitle',
      desc: 'seriously?',
      args: [],
    );
  }

  String get gameMessageReallyMessage {
    return Intl.message(
      'This option is unavailable :/',
      name: 'gameMessageReallyMessage',
      desc: 'cant be used',
      args: [],
    );
  }

  String get gameMessageOverMessageTie {
    return Intl.message(
      'Game ended in a tie!',
      name: 'gameMessageOverMessageTie',
      desc: 'game ended in a tie',
      args: [],
    );
  }

  String get gameMessageOverTitleWinner {
    return Intl.message(
      'Winner!',
      name: 'gameMessageOverTitleWinner',
      desc: 'game ended in a win',
      args: [],
    );
  }

  String gameMessageOverMessageWinner(dynamic playerChar) {
    return Intl.message(
      'Player: $playerChar!',
      name: 'gameMessageOverMessageWinner',
      desc: 'game ended in a win',
      args: [playerChar],
    );
  }

  String get gameActionNew {
    return Intl.message(
      'New Game',
      name: 'gameActionNew',
      desc: 'start new game',
      args: [],
    );
  }

  String get gameActionContinue {
    return Intl.message(
      'Continue Game',
      name: 'gameActionContinue',
      desc: 'continue where left off in the game',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale('en', ''),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}