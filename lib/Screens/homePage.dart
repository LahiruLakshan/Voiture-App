import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:voitrure_automobile/Screens/drawer.dart';
import 'package:voitrure_automobile/Screens/towingShop.dart';
import 'package:voitrure_automobile/Screens/tyreShops.dart';
import 'package:voitrure_automobile/Screens/vehiSparePartsList.dart';
import 'package:voitrure_automobile/Screens/vehiTypeList.dart';
import 'package:voitrure_automobile/Screens/widgets/custom_shape.dart';
import 'package:voitrure_automobile/Screens/widgets/responsive_ui.dart';



class HomePage extends StatefulWidget {
  final DocumentSnapshot post;

  const HomePage({Key key, this.post}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Scaffold(
      body: Container(
        height: _height,
        width: _width,
        padding: EdgeInsets.only(bottom: 5),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              clipShape(),
              Center(child: Text("Welcome to Voiture", style: TextStyle(fontSize:  35, fontWeight: FontWeight.bold),)),
              SizedBox(height: 25,),
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 40, right: 20, top: 15, bottom: 15),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0,4),
                          blurRadius: 20,
                          color: Colors.grey.withOpacity(0.20),
                        ),
                      ]
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VehiList()),
                            );
                          },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(25),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.00),
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  "assets/images/Garage.png",
                                  height: 60,
                                  width: 60,
                                ),
                              ),
                              Text("Garages",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                  ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 40, right: 10, top: 15, bottom: 15),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0,4),
                            blurRadius: 20,
                            color: Colors.grey.withOpacity(0.20),
                          ),
                        ]
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TyreShop()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(25),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.0),
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  "assets/images/Tyre.png",
                                  height: 60,
                                  width: 60,
                                ),
                              ),
                              Text("Tyre Shops",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 40, right: 20, top: 15, bottom: 15),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0,4),
                            blurRadius: 20,
                            color: Colors.grey.withOpacity(0.20),
                          ),
                        ]
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VehiSparePartsList()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(25),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.00),
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  "assets/images/spare.png",
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                              Text("Spare Parts",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 50, right: 10, top: 15, bottom: 15),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0,4),
                            blurRadius: 20,
                            color: Colors.grey.withOpacity(0.20),
                          ),
                        ]
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TowingShop()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(25),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.00),
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  "assets/images/tow.png",
                                  height: 60,
                                  width: 60,
                                ),
                              ),
                              Text("Towing",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        MapUtils.openMap(6.827757, 80.029702);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 0.0),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.0),
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                "assets/images/maps.png",
                                height: 70,
                                width: 70,
                              ),
                            ),
                            Text("Open map",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              //welcomeTextRow(),
             // signInTextRow(),
              //form(),
             // forgetPassTextRow(),
              SizedBox(height: _height / 12),
             // button(),
             // signUpTextRow(),
            ],
          ),
        ),
      ),
      drawer: Mydrawer(post: widget.post,),
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



}

void launchMap(String address) async {
  String query = Uri.encodeComponent(address);
  String googleUrl = "https://www.google.com/maps/search/?api=1&query=$query";
  if (await canLaunch(googleUrl)) {
    await launch(googleUrl);
  }
}

class MapUtils{
  MapUtils._();

  static Future<void>openMap(double lat, double long)async{
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$lat,$long';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }


}







const String _svg_a5gal2 =
    '<svg viewBox="39.0 581.0 107.0 122.0" ><path transform="translate(39.0, 581.0)" d="M 53.5 0 C 83.04723358154297 0 107 27.31063461303711 107 61 C 107 81.01134490966797 85.30865478515625 110.0522308349609 85.30865478515625 110.0522308349609 C 85.30865478515625 110.0522308349609 65.49629974365234 122 53.5 122 C 23.95276641845703 122 0 94.68936157226563 0 61 C 0 27.31063461303711 23.95276641845703 0 53.5 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
