import 'dart:math';
import 'package:async/async.dart';

import 'package:flutter/material.dart';
import 'package:wack_a_mole/src/helper/colorHelper.dart';
import 'package:wack_a_mole/src/views/game/startGameView.dart';

import '../../components/waveButton/rippleAnimation.dart';

class GameView extends StatefulWidget {
  GameView({super.key});

  Random randomInstance = Random();
  bool gameStarted = false;
  int score = 0;
  int life = 3;
  int bonus = 0;
  late Duration duration;
  late RestartableTimer timer;
  int timerDimension = 14;

  List<Widget> moles = [];

  @override
  _GameView createState() => _GameView();
}

class _GameView extends State<GameView> {
  /* This method is trigger by the timer so the player missed the button */
  void tick() {
    nextLevel(false);
  }

  /* start the timer */
  void onStartGame() {
    setState(() {
      widget.duration = Duration(seconds: widget.timerDimension);
      widget.gameStarted = true;
      widget.timer = RestartableTimer(widget.duration, tick);
      appendNew();
    });
  }

  /*
  * Pass to the next level and remove point or add depend of the bool passed
  */
  void nextLevel(bool success) {
    widget.timer.cancel();
    widget.timer =
        RestartableTimer(widget.duration -= Duration(seconds: 1), tick);

    setState(() {
      success ? win() : loose();
      appendNew();
    });
  }

  /*
  * Add points if the player hits a mole
  */
  void win() {
    setState(() {
      widget.bonus += 15;
      widget.score += (10 * widget.bonus);
    });
  }

  /* 
  * Remove points if the player misses a mole
  */
  void loose() {
    setState(() {
      widget.life -= 1;

      if (widget.life == 0) {
        widget.gameStarted = false;

        Navigator.pop(context, widget.score);

        //need to redirect the the gameoverView
      }
    });
  }

  /*
  * Append new mole to the game
  */
  void appendNew() {
    setState(() {
      widget.moles.clear();
      widget.moles.add(Positioned(
        top: widget.randomInstance.nextInt(500).toDouble(),
        left: widget.randomInstance.nextInt(500).toDouble(),
        child: RipplesAnimation(
          color: ColorHelper.blue,
          size: 40,
          key: widget.key,
          onPressed: () => nextLevel(true),
        ),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.gameStarted) {
      return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            leading: Text("Bonus \n" + widget.score.toString()),
            title: Text("Score \n" + widget.bonus.toString()),
            actions: [
              Text("Life \n" + widget.life.toString()),
            ],
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            toolbarHeight: 120,
          ),
          body: Scaffold(body: Stack(children: widget.moles)));
    } else {
      return StartGameView(key: widget.key, onStartGame);
    }
  }
}
