import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:wack_a_mole/src/views/homeView.dart';
import '../components/waveButton/rippleAnimation.dart';

/// Displays the various settings that can be customized by the user.
///
///
import 'dart:async';
import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
@override
_MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<HomePage> {
  var key;

@override
void initState() {
	super.initState();
	Timer(const Duration(seconds: 2),
		()=>Navigator.pushReplacement(context,
										MaterialPageRoute(builder:
														(context) =>
														const HomeView()
														)
									)
		);
}
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
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RipplesAnimation(
              color: Colors.white,
              key: key,
            ),
            const Text(
              'LOADING AWESOME APP',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    )));
  }
}




