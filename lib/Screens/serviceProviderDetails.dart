import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProviderDetails extends StatefulWidget {
  final DocumentSnapshot post;

  const ProviderDetails({Key key, this.post}) : super(key: key);

  @override
  _ProviderDetailsState createState() => _ProviderDetailsState();
}

class _ProviderDetailsState extends State<ProviderDetails> {

  void customLaunch(command) async{
    if (await canLaunch (command)){
      await launch(command);
    }else{
      print('could not launch $command');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post.data()["OrgName"]),
        backgroundColor: Colors.grey,
      ),
      body: Column(
          children: <Widget>[
            Card(
              child: ListTile(
                leading: IconButton(
                  icon: Icon(Icons.map_sharp, size: 40),
                ),
                  title: Text("Open Location On map"),
                  onTap: () async{

                    launchMap(widget.post.data()["Address"]);

                  //MapUtils.openMap(double.parse(widget.post.data()["Lat"]), double.parse(widget.post.data()["Lan"]));

                  }
              ),
            ),
            Card(
              child: ListTile(
                leading: IconButton(
                  icon: Icon(Icons.call, size: 40),
                ),
                title: Text("Call Hotline"),
                onTap: () {

                  customLaunch("tel:"+widget.post.data()["Mobile"]);

                },

              ),
            ),
          ]
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

void launchMap(String address) async {
  String query = Uri.encodeComponent(address);
  String googleUrl = "https://www.google.com/maps/search/?api=1&query=$query";
  if (await canLaunch(googleUrl)) {
    await launch(googleUrl);
  }
}
