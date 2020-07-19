import 'package:flutter/foundation.dart';

class HelperFunctions{

   static String userLoggedInKey = "USERLOGGEDINKEY"; 

  static saveUserLoggedInDetails({@required bool isLoggedin}) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool(userLoggedInKey, isLoggedin);
  }
  static Future<bool> getUserLoggedInDetails() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
   return  pres.getBool(userLoggedInKey)

  }
}