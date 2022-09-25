import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voitrure_automobile/Screens/userSignUp.dart';
import 'package:voitrure_automobile/Screens/widgets/custom_shape.dart';
import 'package:voitrure_automobile/Screens/widgets/responsive_ui.dart';
import 'package:voitrure_automobile/Screens/widgets/serviceProvider.dart';
import 'package:voitrure_automobile/Screens/widgets/textformfield.dart';

import 'constants/constants.dart';
import 'homePage.dart';



class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInScreen(),
    );
  }
}

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();
  String username, pass;



  @override
  Widget build(BuildContext context) {
    _height = MediaQuery
        .of(context)
        .size
        .height;
    _width = MediaQuery
        .of(context)
        .size
        .width;
    _pixelRatio = MediaQuery
        .of(context)
        .devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      child: Container(
        height: _height,
        width: _width,
        padding: EdgeInsets.only(bottom: 5),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              clipShape(),
              welcomeTextRow(),
              signInTextRow(),
              form(),
              forgetPassTextRow(),
              SizedBox(height: _height / 12),
              button(),
              signUpTextRow(),
              SizedBox(height: 75,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceProvider() ));
                },
                child: RichText(text: TextSpan(
                  text: "Register",
                  style: TextStyle(color: Colors.orange.shade300, fontSize: 20, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: " as a service provider",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    )
                  ]
                )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget clipShape() {
    //double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.99,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: _large ? _height / 4 : (_medium
                  ? _height / 3.75
                  : _height / 3.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.amber[600], Colors.black54],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            clipper: CustomShapeClipper2(),
            child: Container(
              height: _large ? _height / 4.5 : (_medium
                  ? _height / 4.25
                  : _height / 4),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.amber[400], Colors.black54],
                ),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(
              top: _large ? _height / 30 : (_medium ? _height / 25 : _height /
                  20)),
          child: Image.asset(
            'assets/images/login.png',
            height: _height / 3.5,
            width: _width / 3.5,
          ),
        ),
      ],
    );
  }

  Widget welcomeTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 20, top: _height / 100),
      child: Row(
        children: <Widget>[
          Text(
            "Welcome to Voiture",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
        ],
      ),
    );
  }

  Widget signInTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 15.0),
      child: Row(
        children: <Widget>[
          Text(
            "Log in to your account",
            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: _large ? 20 : (_medium ? 17.5 : 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0,
          right: _width / 12.0,
          top: _height / 15.0),
      child: Form(
        key: _key,
        child: Column(
          children: <Widget>[
            Container(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: <Widget> [
                        IconButton(icon: Icon(Icons.email, size: 40,), onPressed: () {}),
                        Expanded(child:
                        Container(
                            margin: EdgeInsets.only(left: 12, right: 30),
                            child: TextFormField(
                              onChanged: (val){
                                username = val;
                              },


                              validator: (value){
                              if(value.isEmpty){
                                return "Invalid Email address";
                              }
                              if (!RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?").hasMatch(value))
                              {
                                return 'Invalid Email format';
                              }
                              return null;
                              },


                              onSaved: (value){
                                username = value;
                              },


                              decoration: InputDecoration(
                                hintText: 'Enter Email here',
                              ),
                            )))
                      ],),
                  ),
                )
            ),
            SizedBox(height: _height / 40.0),
            Container(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: <Widget> [
                        IconButton(icon: Icon(Icons.lock, size: 40,), onPressed: () {}),
                        Expanded(child:
                        Container(
                            margin: EdgeInsets.only(left: 12, right: 30),
                            child: TextFormField(
                              obscureText: true,
                              onChanged: (val){
                                pass = val;
                              },


                              validator: (value){
                                if(value.isEmpty){
                                  return "*required";
                                }else{
                                  pass = value;
                                }
                                return null;
                              },


                              onSaved: (value){
                                pass = value;
                              },


                              decoration: InputDecoration(
                                hintText: 'Enter password here',
                              ),
                            )))
                      ],),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }


  Widget forgetPassTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Forgot your password?",
            style: TextStyle(fontWeight: FontWeight.w400,
                fontSize: _large ? 14 : (_medium ? 12 : 10)),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              print("Routing");
            },
            child: Text(
              "Recover",
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.orange[200]),
            ),
          )
        ],
      ),
    );
  }

  Widget button() {
    // ignore: deprecated_member_use
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () async{
      if(_key.currentState.validate()) {

        var res = await FirebaseFirestore.instance.collection("user").doc(username).get();

        if(res.exists) {
          var post = await FirebaseFirestore.instance.collection("user").doc(
              username).get().then((DocumentSnapshot snapshot) async {
            var e = snapshot.get("Email");
            var p = snapshot.get("Password");


            if (e == username && p == pass) {
              try {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => HomePage(post: snapshot)));
                Scaffold
                    .of(context)
                    .showSnackBar(SnackBar(content: Text('Login Successful')));
                print(snapshot.data());
              } catch (ee) {
                print(ee.message);
              }
            }
          });
        }else{
          emailExist(context);

        }
      }else{
        errorLogin(context);
      }

        print("Routing to your account");
        // Scaffold
        //     .of(context)
        //     .showSnackBar(SnackBar(content: Text('Login Successful')));
      },
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
        width: _large ? _width / 4 : (_medium ? _width / 3.75 : _width / 3.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: <Color>[Colors.amber[600], Colors.amber],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text('LOG IN',
            style: TextStyle(fontSize: _large ? 14 : (_medium ? 12 : 10))),
      ),
    );
  }

  Widget signUpTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 120.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Don't have an account?",
            style: TextStyle(fontWeight: FontWeight.w400,
                fontSize: _large ? 14 : (_medium ? 12 : 10)),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> UserSignIn()));
            },
            child: Text(
              "Sign up",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.orange[200],
                  fontSize: _large ? 19 : (_medium ? 17 : 15)),
            ),
          )
        ],
      ),
    );
  }
  Widget spsignupTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 120.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Don't have an account?",
            style: TextStyle(fontWeight: FontWeight.w400,
                fontSize: _large ? 14 : (_medium ? 12 : 10)),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(SIGN_UP);
              print("Routing to Sign up screen");
            },
            child: Text(
              "Sign up",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.orange[200],
                  fontSize: _large ? 19 : (_medium ? 17 : 15)),
            ),
          )
        ],
      ),
    );
  }

}

Future<void> errorLogin(BuildContext context) async {
  var alertDialog = CupertinoAlertDialog(
    title: Text("Invalid details!"),
    content: Text(
      "\nPlease check the email and password again",
      style: TextStyle(fontSize: 15),),
    actions: [
      CupertinoDialogAction(child: Text("OK"), onPressed: () {
        Navigator.pop(context);
      },),
    ],

  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      }
  );
}


Future<void> emailExist(BuildContext context) async {
  var alertDialog = CupertinoAlertDialog(
    title: Text("Email is not Exist"),
    content: Text(
      "\nPlease register first",
      style: TextStyle(fontSize: 15),),
    actions: [
      CupertinoDialogAction(child: Text("OK"), onPressed: () {
        Navigator.pop(context);
      },),
    ],

  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      }
  );
}