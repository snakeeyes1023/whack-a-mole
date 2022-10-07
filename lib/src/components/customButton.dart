
import 'package:flutter/material.dart';

import '../helper/colorHelper.dart';



class LinkButton extends StatefulWidget {
  LinkButton({super.key, required this.text, isActive = false,this.onClick})
      : this.isActive = isActive;

  final String text;
  final bool isActive;
  var textColor = Colors.white;
  double scaleMutliplier = 1;
  VoidCallback? onClick;


 
  @override
  _LinkButton createState() => _LinkButton();

  
}


class _LinkButton extends State<LinkButton> {
  VoidCallback? onClick;

  onButtonClicked() {
    // 
    if (widget.onClick != null) {
      widget.onClick!.call();
    } else {
      print("Link button clicked");
    }
  }

   Widget build(BuildContext context) {

    return 
    GestureDetector(

      onTapDown: (details) => setState(() {
        widget.textColor = Colors.black;
        widget.scaleMutliplier = 1.1;
      }),
      onTapCancel: () => setState(() {
        widget.textColor = Colors.white;
        widget.scaleMutliplier = 1;
      }),
      
      

    child:
    ElevatedButton(
      onPressed: () {

      onButtonClicked();

    
      },
      style: ButtonStyle(

        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed))
          return widget.isActive ? ColorHelper.blue : Colors.white ; 
        return Colors.transparent;
      },
  
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          ),
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(
              color: widget.isActive ? ColorHelper.blue : Colors.white,
              width: 2,
            ),
          ),
          minimumSize: MaterialStateProperty.all<Size>(
            Size(300 * widget.scaleMutliplier, 60 * widget.scaleMutliplier)
          ),

        ),
      

      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(30.0),
      //   ),
      //   side: BorderSide(
      //       width: 2.0, color: isActive ? ColorHelper.blue : Colors.white),
      //   minimumSize: Size(300, 60),
      // ),
      child: Text(
        widget.text.toUpperCase(),
        style: TextStyle(
          color: widget.textColor,
          fontSize: 20,
          fontWeight: widget.isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      //change the color of outline
    ),
    );
  }
  
}
