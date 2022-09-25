import 'package:flutter/material.dart';
import 'package:voitrure_automobile/Screens/widgets/custom_shape.dart';
import 'package:voitrure_automobile/Screens/widgets/responsive_ui.dart';

import 'homePage.dart';



class Home extends StatelessWidget {
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


              SizedBox(height: _height / 12),
              button(),
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
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }



  Widget button() {
    return RaisedButton(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        print("Routing to your sign in page");
        Scaffold
            .of(context)
            .showSnackBar(SnackBar(content: Text('Directing to login page')));
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



Widget button1() {
  // ignore: deprecated_member_use
  return RaisedButton(
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      // print("Routing to your sign in page");
      // Scaffold
      //     .of(context)
      //     .showSnackBar(SnackBar(content: Text('Directing to login page')));
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


}