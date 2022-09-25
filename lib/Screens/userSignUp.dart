
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voitrure_automobile/Screens/signin.dart';
import 'package:voitrure_automobile/Screens/widgets/custom_shape.dart';
import 'package:voitrure_automobile/Screens/widgets/customappbar.dart';
import 'package:voitrure_automobile/Screens/widgets/responsive_ui.dart';

class UserSignIn extends StatefulWidget {
  const UserSignIn({Key key}) : super(key: key);

  @override
  _UserSignInState createState() => _UserSignInState();
}

class _UserSignInState extends State<UserSignIn> {
  bool checkBoxValue = false;
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  String fname, lname, email, mobile, passw;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium =  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);


    return Scaffold(
      body: Container(
        height: _height,
        width: _width,
        margin: EdgeInsets.only(bottom: 5),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Opacity(opacity: 0.88,child: CustomAppBar()),
              //clipShape(),
            Stack(
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
            ),
              form(),
              SizedBox(height: _height/35,),
              button(),
              //signInTextRow(),
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
          height: _height / 5.5,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  spreadRadius: 0.0,
                  color: Colors.black26,
                  offset: Offset(1.0, 10.0),
                  blurRadius: 20.0),
            ],
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: GestureDetector(
              onTap: (){


                print('Adding photo');
              },
              child: Icon(Icons.add_a_photo, size: _large? 40: (_medium? 33: 31),color: Colors.amber[800],)),
        ),
      ],
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left:_width/ 12.0,
          right: _width / 12.0,
          top: _height / 100.0),
      child: Form(
        child: Column(
          children: <Widget>[
            Container(
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text("SignUp to Voiture", textAlign: TextAlign.right, style: TextStyle(fontSize: 25, color: Colors.orange, fontWeight: FontWeight.bold),)),

            ),
            SizedBox(height: 20,),
            Container(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: <Widget> [
                        IconButton(icon: Icon(Icons.person, size: 40,), onPressed: () {}),
                        Expanded(child:
                        Container(
                            margin: EdgeInsets.only(left: 12, right: 30),
                            child: TextFormField(
                              onChanged: (val){
                                fname = val;
                              },


                              validator: (value){
                                if(value.isEmpty){
                                  return "*required";
                                }else{
                                  fname = value;
                                }
                                return null;
                              },


                              onSaved: (value){
                                fname = value;
                              },


                              decoration: InputDecoration(
                                hintText: 'First Name',
                              ),
                            )))
                      ],),
                  ),
                )
            ),
            SizedBox(height: 20,),
            Container(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: <Widget> [
                        IconButton(icon: Icon(Icons.person, size: 40,), onPressed: () {}),
                        Expanded(child:
                        Container(
                            margin: EdgeInsets.only(left: 12, right: 30),
                            child: TextFormField(
                              onChanged: (val){
                                lname = val;
                              },


                              validator: (value){
                                if(value.isEmpty){
                                  return "*required";
                                }else{
                                  lname = value;
                                }
                                return null;
                              },


                              onSaved: (value){
                                lname = value;
                              },


                              decoration: InputDecoration(
                                hintText: 'Last Name',
                              ),
                            )))
                      ],),
                  ),
                )
            ),
            SizedBox(height: 20,),
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
                                email = val;
                              },


                              validator: (value){
                                if(value.isEmpty){
                                  return "*required";
                                }else{
                                  email = value;
                                }
                                return null;
                              },


                              onSaved: (value){
                                email = value;
                              },


                              decoration: InputDecoration(
                                hintText: 'E-mail address',
                              ),
                            )))
                      ],),
                  ),
                )
            ),
            SizedBox(height: 20,),
            Container(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: <Widget> [
                        IconButton(icon: Icon(Icons.mobile_friendly, size: 40,), onPressed: () {}),
                        Expanded(child:
                        Container(
                            margin: EdgeInsets.only(left: 12, right: 30),
                            child: TextFormField(
                              onChanged: (val){
                                mobile = val;
                              },


                              validator: (value){
                                if(value.isEmpty){
                                  return "*required";
                                }else{
                                  mobile = value;
                                }
                                return null;
                              },


                              onSaved: (value){
                                mobile = value;
                              },


                              decoration: InputDecoration(
                                hintText: 'Mobile Number',
                              ),
                            )))
                      ],),
                  ),
                )
            ),
            SizedBox(height: 20,),
            Container(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: <Widget> [
                        IconButton(icon: Icon(Icons.home, size: 40,), onPressed: () {}),
                        Expanded(child:
                        Container(
                            margin: EdgeInsets.only(left: 12, right: 30),
                            child: TextFormField(
                              obscureText: true,
                              onChanged: (val){
                                passw = val;
                              },


                              validator: (value){
                                if(value.isEmpty){
                                  return "*required";
                                }else{
                                  passw = value;
                                }
                                return null;
                              },


                              onSaved: (value){
                                passw = value;
                              },


                              decoration: InputDecoration(
                                hintText: 'Password',

                              ),
                            )))
                      ],),
                  ),
                )
            ),



            SizedBox(height: 5,),
          ],
        ),
      ),
    );
  }




  Widget button() {
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () async{
        Map<String, dynamic> userData = {
          "Firstname": fname,
          "Lastname": lname,
          "Email": email,
          "Mobile": mobile,
          "Password": passw,
        };
        DocumentReference setuser = FirebaseFirestore.instance.collection("user").doc(email.toString());
        setuser.set(userData);
        dialog(context);


        print("Routing to your account");
      },
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
//        height: _height / 20,
        width:_large? _width/4 : (_medium? _width/3.75: _width/3.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: <Color>[Colors.amber[600], Colors.amber],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text('SignUp', style: TextStyle(fontSize: _large? 14: (_medium? 12: 10)),),
      ),
    );
  }
}

void dialog(BuildContext context){

  var alertDialog = CupertinoAlertDialog(
    title: Text("Registered Successfully"),
    content: Text("\nYou have to Sgin in again", style: TextStyle(fontSize: 15),),
    actions: [
      CupertinoDialogAction(child: Text("OK"),onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignInPage()),
        );
      },),
    ],

  );

  showDialog(
      context: context,
      builder: (BuildContext context){
        return alertDialog;
      }
  );

}


