import 'package:flutter/material.dart';

// This widget is the root
// of your application

class pageLoading extends StatelessWidget {
@override
Widget build(BuildContext context) {
	return MaterialApp(
	home: Scaffold(
		
		body: Center(
		child: Column(
			children: <Widget>[
			Image.asset(
				'assets/images/im-og_image.png',
				height: 400,
				width: 400,
			), 
      const Text(
        'Whack a Mole',
        style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        ),
      ),
      const Text(
        'Loading...',
        style: TextStyle(
        fontSize: 20,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        ),
      ),
      
			], //<Widget>[]
		), //Column
		), //Center
	),
	);
}
}

