import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:wack_a_mole/src/screens/update_screen.dart';

import '../components/custom_button.dart';
import '../data/entities/score_entity.dart';
import '../data/services/score_services.dart';
import 'home_screen.dart';
import 'package:jiffy/jiffy.dart';

/// Displays the various settings that can be customized by the user.
///
class HighscoreScreen extends StatefulWidget {
  HighscoreScreen({super.key});

  final dbHelper = ScoreService();

  List<ScoreEntity> scores = [];

  var listIndex;

  @override
  _HighscoreScreenState createState() => _HighscoreScreenState();
}

class _HighscoreScreenState extends State<HighscoreScreen> {
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
                child: Column(children: [
                  Padding(
                      padding:
                          const EdgeInsets.only(top: 60, left: 30, right: 30),
                      //master text and some text
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                'HIGHSCORES',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.width *
                                        0.02),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 250,
                                        child: FutureBuilder(
                                            future: widget.dbHelper.scores(),
                                            builder: (context, snapshot) {
                                              if (snapshot.hasData) {
                                                widget.scores = snapshot.data!;

                                                return ListView.separated(
                                                  itemCount:
                                                      widget.scores.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return GestureDetector(
                                                      onTapDown: (details) =>
                                                          setState(() {
                                                        // On récupère l'index de l'élément sur lequel on a cliqué
                                                        widget.listIndex =
                                                            index;
                                                      }),
                                                      onTapUp: (details) =>
                                                          setState(() {
                                                        widget.listIndex = null;
                                                      }),
                                                      onTapCancel: () =>
                                                          setState(() {
                                                        widget.listIndex = null;
                                                      }),
                                                      child: Container(
                                                        height: 50,

                                                        // Si l'index égal à l'index de la liste, alors on change la couleur

                                                        color:
                                                            (widget.listIndex ==
                                                                    index)
                                                                ? Colors
                                                                        .blue[
                                                                    index % 2 ==
                                                                            0
                                                                        ? 600
                                                                        : 500]
                                                                : Colors
                                                                        .grey[
                                                                    index % 2 ==
                                                                            0
                                                                        ? 600
                                                                        : 500],

                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: <Widget>[
                                                            Padding(
                                                              padding: EdgeInsets.only(
                                                                  left: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.02),
                                                              child: Text(
                                                                Jiffy(widget
                                                                        .scores[
                                                                            index]
                                                                        .creationDate)
                                                                    .yMd,
                                                                style:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              widget
                                                                  .scores[index]
                                                                  .name,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.only(
                                                                  right: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.02),
                                                              child: Text(
                                                                widget
                                                                    .scores[
                                                                        index]
                                                                    .score
                                                                    .toString(),
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding: EdgeInsets.only(
                                                                    right: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.02),
                                                                child:
                                                                    TextButton(
                                                                  style:
                                                                      ButtonStyle(
                                                                    foregroundColor: MaterialStateProperty.all<
                                                                            Color>(
                                                                        Colors
                                                                            .blue),
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator
                                                                        .push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              UpdateScreen(scoreEntity: widget.scores[index])),
                                                                    );
                                                                  },
                                                                  child: Text(
                                                                      'Modifier'),
                                                                )),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  separatorBuilder:
                                                      (BuildContext context,
                                                              int index) =>
                                                          const Divider(
                                                    height: 2,
                                                  ),
                                                );
                                              } else {
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              }
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Center(
                                      child: LinkButton(
                                    text: 'BACK TO MENU',
                                    onClick: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomeScreen()),
                                      );
                                    },
                                  ))),
                            ]),
                      )),
                ]))));
  }
}
