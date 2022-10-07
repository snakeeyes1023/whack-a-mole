import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../../components/waveButton/ripple_animation.dart';

/// Displays the various settings that can be customized by the user.
///
class StartGameScreen extends StatelessWidget {
  const StartGameScreen(this._onStartGame, {super.key});

  final Function _onStartGame;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 28, 79),
        body: Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
          width: double.infinity,
          height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
          repeat: ImageRepeat.repeat,
        image: Svg('assets/images/backgroundPattern.svg', size: Size.square(35)),
        colorFilter: ColorFilter.mode(Color.fromARGB(255, 33, 82, 150), BlendMode.modulate),
      )),
        child: Padding(
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
    ))));
  }
 
}
