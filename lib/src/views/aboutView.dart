import 'package:flutter/material.dart';
import '../components/waveButton/rippleAnimation.dart';

/// Displays the various settings that can be customized by the user.
///
class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(100),
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
                    'ABOUT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
              const Center(
                  child: Text(
                'lorem ipsumIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
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
                key: key,
              ))
            ]),
      )),
    ));
  }
}
