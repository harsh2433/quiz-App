import 'package:flutter/material.dart';
import 'package:quiz/home.dart';
import 'package:quiz/signin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedin = false;

  @override
  void initState() {
   checkUserLoggedInStatus();
    super.initState();
  }
  checkUserLoggedInStatetus()async{
     HelperFunctions.getUserLoggedInDetails().then((vlaue){
       setState(() {
         _isLoggedin = value;
       });
     });
  }   

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: _(isLoggedin ?? false) ? Home() : SignIn(),
    );
  }
}
