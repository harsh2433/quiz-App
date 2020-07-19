import 'package:flutter/material.dart';
import 'package:quiz/auth.dart';
import 'package:quiz/signup.dart';
import 'package:quiz/widgets.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  String email, password;
  AuthService authService = new Authservice();

  bool _isLoading = false;

  SignIn()async {
    if(_formKey.currentState.validate()){

      setState(() {
         _isLoading = true;
      });

      await authService.signInEmailAndPass(email, password).then(val){
        if(val != null){setState(() {
         isLoading = false;
      });
      HelperFunctions.saveUserLoggedDetails(isLoggedin : true);

          Navigator.pushReplacement(context, MaterialPageRoute(
        Builder(context) => Home()
          ),);


        }
      };

      
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
      ),
      body:  _isLoading ? Container(
           child: Center(
             child: CircularProgressIndicator(),
             ),
      ) :  Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Spacer(),
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
                      signIn();
                    },
                    child: blueButton(
                      context : context,
                      label :"Sign In"),
                  ),
                  SizedBox(
                    height: 18,
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Don't have an account? ",style: TextStyle(fontSize: 15.5),), 
                             
                             GestureDetector(
                                onTap: (){
                                  MaterialPageRoute materialPageRoute = MaterialPageRoute(
                              Builderbuilder: (context) => SignUp(), builder: (BuildContext context) {}
                               );
                                          MaterialPageRoute materialPageRoute2 = materialPageRoute;
                                          var materialPageRoute = materialPageRoute2;
                                          Navigator.pushReplacement(context, materialPageRoute);
                                },
                             ), Text("Sign Up ",style: TextStyle(fontSize: 15.5,decoration: TextDecoration.underline),)
                              ],
                  ),
                  SizedBox(
                    height: 80,
                  ),
                ],
              ),
          ),
        ),
      );
  }
}
