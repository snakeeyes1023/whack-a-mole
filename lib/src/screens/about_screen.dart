import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import '../components/waveButton/ripple_animation.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

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
                child: Padding(
                  padding: EdgeInsets.only(top: 20, left: 30, right: 30),
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
                            color: Colors.white,
                            onPressed: () => Navigator.pop(context),
                            key: key,
                          ))
                        ]),
                  )),
                ))));
  }
}
