import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../components/custom_button.dart';
import '../components/input/custom_input_field.dart';
import '../helper/color_helper.dart';
import '../data/entities/score_entity.dart';
import '../data/services/score_services.dart';

class ScoreValidatorView extends StatefulWidget {
  ScoreValidatorView({super.key});

  Random randomInstance = Random();
  String scoreExists = '';

  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController scoreController = TextEditingController();

  final dbHelper = ScoreService();

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

      ScoreEntity score =
          ScoreEntity(0,int.parse(widget.scoreController.text),widget.nameController.text, );

      widget.dbHelper.insertScore(score);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                child: Column(children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 60, left: 30, right: 30),
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
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: Center(
                                    child: LinkButton(
                                  text: 'VALIDATE SCORE',
                                  isActive: true,
                                  onClick: () {
                                    _showIsScoreExist();
                                  },
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
                ]))));
  }
}
