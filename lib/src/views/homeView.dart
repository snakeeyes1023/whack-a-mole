import 'package:flutter/material.dart';
import 'package:wack_a_mole/src/components/linkButton.dart';
import 'package:wack_a_mole/src/helper/colorHelper.dart';
import 'package:wack_a_mole/src/views/aboutView.dart';
import '../components/waveButton/rippleAnimation.dart';

/// Displays the various settings that can be customized by the user.
///
///
///
///



class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(30),
      //master text and some text
      child: Center(
          child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 20, left: 30, right: 30),
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
                  padding: EdgeInsets.only(top: 10),
                  child: Center(
                      child: LinkButton(
                    text: 'PLAY',
                    isActive: true,
                  ))),
              Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Center(
                      child: LinkButton(
                    text: 'HIGH SCORES',
                  ))),
              Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Center(
                      child: LinkButton(
                    text: 'SCORE VALIDATOR',
                  ))),
              Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Center(
                      child: LinkButton(
                    text: 'ABOUT',
                    onClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutView()),
                      );
                    },
                  )))
            ]),
      )),
    ));
  }
}
