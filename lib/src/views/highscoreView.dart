import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:wack_a_mole/src/views/homeView.dart';
import '../components/customButton.dart';

/// Displays the various settings that can be customized by the user.
///
class HighscoreView extends StatefulWidget {
  HighscoreView({super.key});

  final List<String> entriesDate = <String>[
    '06/10/2022 15:04:55',
    '06/10/2022 15:04:55',
    '06/10/2022 15:04:55',
    '06/10/2022 15:04:55',
    '06/10/2022 15:04:55',
    
    
  ];
  final List<String> entriesPlayerName = <String>[
    'PLAYERA',
    'PLAYERB',
    'PLAYERC',
    'PLAYERD',
    'PLAYERE'
  ];
  final List<String> entriesScore = <String>[
    '1000',
    '2000',
    '5000',
    '4500',
    '10000'
  ];


  var listIndex;

  

  @override
  _HighscoreViewState createState() => _HighscoreViewState();

}



  class _HighscoreViewState extends State<HighscoreView> {

    

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
                                          child: ListView.separated(
                                            itemCount: widget.entriesDate.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return GestureDetector(

                                                onTapDown: (details) => setState(() {

                                                  // On récupère l'index de l'élément sur lequel on a cliqué
                                                  widget.listIndex = index;
                                                }),

                                                onTapUp: (details) => setState(() {
                                                  widget.listIndex = null;
                                                }),

                                              
                                                child: Container(
                                                height: 50,

                                                // Si l'index égal à l'index de la liste, alors on change la couleur

                                                color: (widget.listIndex == index) ? Colors.blue[index % 2 == 0 ? 600 : 500] : Colors.grey[index % 2 == 0 ? 600 : 500],
                                              

                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: <Widget>[                                                    
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: MediaQuery.of(
                                                              context)
                                                              .size
                                                              .width *
                                                              0.02),
                                                      child: Text(
                                                        widget.entriesDate[index],
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  
                                                     Text(
                                                        widget.entriesPlayerName[
                                                            index],
                                                        textAlign: TextAlign.center,
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.white),
                                                      )
                                                    ,
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.02),
                                                      child: Text(
                                                        widget.entriesScore[index],
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
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
                                          )),
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
                                            builder: (context) => HomeView()),
                                      );
                                    },
                                  ))),
                            ]),
                      )),
                ]))));
  }
}

