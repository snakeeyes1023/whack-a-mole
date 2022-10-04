import 'dart:math';

import 'package:flutter/material.dart';

import '../components/input/customInputField.dart';
import '../components/customButton.dart';
import '../helper/colorHelper.dart';

class ScoreValidatorView extends StatefulWidget {
  ScoreValidatorView({super.key});

  Random randomInstance = Random();
  String scoreExists = '';

  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController scoreController = TextEditingController();

  @override
  _ScoreValidatorViewState createState() => _ScoreValidatorViewState();
}

class _ScoreValidatorViewState extends State<ScoreValidatorView> {
  /*
  * This function is called when the user clicks the "Validate" button.à
  * It will check if the score exist (random) if field are not empty.
  */
  void _showIsScoreExist() {
    if (widget.dateController.text != '' &&
        widget.nameController.text != '' &&
        widget.scoreController.text != '') {
      setState(() {
        widget.scoreExists =
            (widget.randomInstance.nextDouble() > .5).toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    children: [
                      Image.asset('assets/images/backIcon.png',
                          width: 60, height: 60),
                      const Text('BACK',
                          style: TextStyle(
                              color: ColorHelper.blue,
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                              fontWeight: FontWeight.w500))
                    ],
                  ))),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 120,
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
            //master text and some text
            child: Center(
                child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                        child: Image.asset('assets/images/validate.png',
                            height: 100)),
                    const Text(
                      'SCORE VALIDATOR',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: Divider(
                          color: Colors.white,
                          thickness: 1,
                        )),
                    CustomInputField(
                      fieldController: widget.dateController,
                      text: 'DATE :',
                      labelText: 'DD/MM/YYYY',
                    ),
                    CustomInputField(
                      fieldController: widget.nameController,
                      text: 'NAME :',
                    ),
                    CustomInputField(
                      fieldController: widget.scoreController,
                      text: 'SCORE :',
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Center(
                            child: LinkButton(
                          text: 'VALIDATE SCORE',
                          isActive: true,
                          onClick: () { _showIsScoreExist(); },
                        ))),
                    const Padding(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: Divider(
                          color: Colors.white,
                          thickness: 1,
                        )),
                    Center(
                      child: Text(
                        'Score exist : ${widget.scoreExists}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ]),
            )),
          )
        ]));
  }
}
