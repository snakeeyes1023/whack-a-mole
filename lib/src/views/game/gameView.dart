import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wack_a_mole/src/views/game/startGameView.dart';

class GameView extends StatefulWidget {
  GameView({super.key});

  Random randomInstance = Random();
  bool gameStarted = false;
  int score = 0;
  int life = 3;
  int bonus = 0;

  @override
  _GameView createState() => _GameView();
}

class _GameView extends State<GameView> {
  void _onStartGame() {
    setState(() {
      widget.gameStarted = true;
    });
  }

  void _nextLevel(bool success) {
    setState(() {
      if (success) {
        widget.score += 120;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.gameStarted) {
      return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            leading: Text("Bonus" + "\n" + widget.score.toString()),
            title: Text("Score" + "\n" + widget.bonus.toString()),
            actions: [
              Text("Life" + "\n" + widget.life.toString()),
            ],
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            toolbarHeight: 120,
          ),
          body: const Scaffold(
            body: Text("game"),
          ));
    } else {
      return StartGameView(key: widget.key, _onStartGame);
    }
  }
}
