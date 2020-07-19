

import 'package:flutter/material.dart';
import 'package:quiz/auth.dart';
import 'package:quiz/home.dart';
import 'package:quiz/signin.dart';
import 'package:quiz/widgets.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

 final _formKey = GlobalKey<FormState>();
   String name,email, password;
   Authservice authservice = new Authservice();
   bool _isLoading = false;

   SignUp()async {
     if(_formKey.currentState..validate()){
       setState(() {
         _isLoading = true;
       });

       authservice.signUpWithEmailAndPassword(email, password).then((value){
         if(value != null){
           setState(() {
         _isLoading = false;
       });
        HelperFunctions.saveUserLoggedDetails(isLoggedin : true);
           Navigator.pushReplacement(context,MaterialPageRoute(
             builder: (context) => Home(),
           ));
         }
       });

     }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Widget(child: appBar(context)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
      ),
      body:_isLoading ? Container(
        child: Center(child: CircularProgressIndicator(),),
      ): Form (
        key: _formKey, 
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Spacer(),
              TextFormField(
                validator: (val) {
                  return val.isEmpty ? "Enter Name" : null;
                },
                decoration: InputDecoration(hintText: "Name"),
                onChanged: (val) {
                  name = val;
                },
              ),
              SizedBox(
                height: 6,
              ),  
              TextFormField(
                validator: (val) {
                  return val.isEmpty ? "Enter emailid" : null;
                },
                decoration: InputDecoration(hintText: "Email"),
                onChanged: (val) {
                  email = val;
                },
              ),
              SizedBox(
                height: 6,
              ),  
              TextFormField(
                obscureText: true,
                validator: (val) {
                  return val.isEmpty ? "Enter Password" : null;
                },
                decoration: InputDecoration(hintText: "Password"),
                onChanged: (val) {
                  password = val;
                },
              ),
              SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: (){

                    SignUp();
                },
              ),
            ],
              child: blueButton(
                context : context,
                label :"Sign Up"
                ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Already have an account? ",style: TextStyle(fontSize: 15.5),), 
                          
                          GestureDetector(
                            onTap: (){
                              Navigator.PushReplacement(context, MaterialPageRoute(
                                Builder(context) => SignIn()
                              ));

                            },
                          ),
                          Text("Sign In ",style: TextStyle(fontSize: 15.5,decoration: TextDecoration.underline),)
                          ],
              ),
              SizedBox(
                height: 80,
              ),
          ),
        ),
      ),
    );
  }
}