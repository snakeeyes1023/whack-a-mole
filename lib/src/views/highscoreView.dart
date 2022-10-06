import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:wack_a_mole/src/views/homeView.dart';
import '../components/customButton.dart';

/// Displays the various settings that can be customized by the user.
///
class HighscoreView extends StatelessWidget {
  const HighscoreView({super.key});

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
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
            //master text and some text
            child: Center(
                child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'HIGHSCORES',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Text(
                          'Liste de bs',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Center(
                      child: LinkButton(
                    text: 'BACK TO MENU',
                    isActive: true,
                    onClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeView()),
                      );
                    },
                  ))),
                  ]),
            )),
          )
        ]))));
  }
}