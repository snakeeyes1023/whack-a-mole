import 'package:flutter/material.dart';

// This widget is the root
// of your application

class pageLoading extends StatelessWidget {
@override
Widget build(BuildContext context) {
	return const MaterialApp(
	home: Scaffold(
		
		body: SafeArea(
		child: Center(
			child: Text(
			  textAlign: TextAlign.center,
			  'LOADING AWESOME STUFF',  
			  style: TextStyle(
			  fontSize: 30,
			  color: Colors.white,
			  fontWeight: FontWeight.bold,
			  ),
			), //<Widget>[]
		), //Column
		), //Center
	),
	);
}
}

