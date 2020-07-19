import 'dart:html';

import 'package:flutter/material.dart';
import 'package:quiz/widgets.dart';

class Results extends StatefulWidget {
  final int correct, incorrect, total;
  Results({@required this.correct, @required this.incorrect,@required this.total});

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
            Text("${widget.correct}/${widget.total}", style: TextStyle(fontSize: 25), ),
            SizedBox(height: 8,),
            Text("You answered ${widget.correct}answers correctly"
            "and ${widget.incorrect}answers incorrectly", style: TextStyle(fontSize: 15, color:Colors.grey,
             textAlign: TextAlign.center),)
             SizedBox(height: 14,),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: blueButton(context, label: "Go to Home",buttonwidth: MediaQuery.of(context.size.width/2) ),)           
          ],)

        ),
      ),
    );
  }
}