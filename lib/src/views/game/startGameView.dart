import 'package:flutter/material.dart';
import '../../components/waveButton/rippleAnimation.dart';

/// Displays the various settings that can be customized by the user.
///
class StartGameView extends StatelessWidget {
  const StartGameView(this._onStartGame, {super.key});

  final Function _onStartGame;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(top: 20, left: 30, right: 30),
      //master text and some text
      child: Center(
          child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Divider(
                    color: Colors.white,
                    thickness: 0.5,
                  )),
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    'Start Game',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Divider(
                    color: Colors.white,
                    thickness: 0.5,
                  )),
              Center(
                  child: RipplesAnimation(
                onPressed: () => _onStartGame(),
                key: key,
              ))
            ]),
      )),
    ));
  }
}
