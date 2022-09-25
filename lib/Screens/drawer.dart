

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:voitrure_automobile/Screens/signin.dart';

class Mydrawer extends StatefulWidget{
 final DocumentSnapshot post;

  final Function onTap;
  Mydrawer({
    this.onTap, this.post,
  });

  @override
  _MydrawerState createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {


  @override
  void initState() {
    super.initState();
    initUser();
  }
  initUser() async {
    setState(() {});
  }



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.8,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(color: Colors.transparent),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: () {

                        },
                         child: Container(
                          width: 500,
                          height: 50,
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            backgroundImage: ExactAssetImage("assets/images/maps.png"),
                            radius: 30,
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Align(
                        alignment: Alignment.center,
                        child: Text(""+widget.post.data()["Firstname"]+ " " +widget.post.data()["Lastname"],
                          style: TextStyle(

                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 3,),
                      Align(
                        alignment: Alignment.center,
                        child: Text(""+widget.post.data()["Email"],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: ()=>widget.onTap(
                Navigator.pop(context),
                ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Edit account'),
              onTap: ()=>widget.onTap(

              ),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Open Map'),
              onTap: ()=>widget.onTap(
                  MapUtils.openMap(6.827757, 80.029702),

              ),
            ),
            Divider(height: 1,),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sign Out'),
              onTap: () async{
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SignInPage()));

              },
            ),
          ],
        ),
      ),
    );
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