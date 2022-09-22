import 'package:flutter/material.dart';
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
      body: Center(
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
    );
  }
}




