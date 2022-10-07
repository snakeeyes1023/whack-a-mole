import 'package:flutter/material.dart';
import 'package:wack_a_mole/src/screens/score_validator_screen.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import '../components/custom_button.dart';
import '../components/waveButton/ripple_animation.dart';
import '../helper/color_helper.dart';
import 'about_screen.dart';
import 'game/game_view_screen.dart';
import 'highscore_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              child: Center(
                  child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 30, right: 30),
                          child: Center(
                              child: RipplesAnimation(
                            key: key,
                          ))),
                      const Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Text(
                            'WHACK-A-MOLE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      const Padding(
                          padding: EdgeInsets.only(bottom: 30),
                          child: Text(
                            'EVERY TAP MATTERS',
                            style: TextStyle(
                              color: ColorHelper.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Center(
                              child: LinkButton(
                            text: 'NEW GAME',
                            isActive: true,
                            onClick: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GameScreen()),
                              );
                            },
                          ))),
                      Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Center(
                              child: LinkButton(
                            text: 'HIGH SCORES',
                            onClick: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HighscoreScreen()),
                              );
                            },
                          ))),
                      Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Center(
                              child: LinkButton(
                            text: 'SCORE VALIDATOR',
                            onClick: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ScoreValidatorView()),
                              );
                            },
                          ))),
                      Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Center(
                              child: LinkButton(
                            text: 'ABOUT',
                            onClick: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AboutScreen()),
                              );
                            },
                          )))
                    ]),
              )),
            )));
  }
}
