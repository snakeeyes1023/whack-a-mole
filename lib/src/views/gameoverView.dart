import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../components/input/customInputField.dart';
import '../components/customButton.dart';
import '../components/waveButton/rippleAnimation.dart';
import '../helper/colorHelper.dart';
import 'homeView.dart';

class GameOverView extends StatefulWidget {
  GameOverView(int score, {key}) : super(key: key) {
    this.score = score;
  }

  Random randomInstance = Random();
  late int score = 0;

  TextEditingController nameController = TextEditingController();

  @override
  _GameoverViewState createState() => _GameoverViewState();
}

class _GameoverViewState extends State<GameOverView> {
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
                  image: Svg('assets/images/backgroundPattern.svg',
                      size: Size.square(35)),
                  colorFilter: ColorFilter.mode(
                      Color.fromARGB(255, 33, 82, 150), BlendMode.modulate),
                )),
                child: Column(children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 60, left: 50, right: 50),
                    //master text and some text
                    child: Center(
                        child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/bugIcon.png',
                                width: 50, height: 50),
                            const Text(
                              'GAME OVER',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'YOU LOST',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: Divider(
                                  color: Colors.white,
                                  thickness: 1,
                                )),
                            const Text(
                              'SCORE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.score.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: Divider(
                                  color: Colors.white,
                                  thickness: 1,
                                )),
                            const Text(
                              'TRY AGAIN?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Center(
                                child: RipplesAnimation(
                              color: Colors.white,
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeView())),
                              key: widget.key,
                            )),
                            CustomInputField(
                              fieldController: widget.nameController,
                              text: 'NAME:',
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Center(
                                    child: LinkButton(
                                  text: 'SAVE SCORE',
                                  onClick: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomeView()));
                                  },
                                ))),
                          ]),
                    )),
                  )
                ]))));
  }
}
