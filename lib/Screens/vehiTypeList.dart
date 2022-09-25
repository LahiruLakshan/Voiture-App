
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voitrure_automobile/Screens/GarageVehiType/Bike.dart';
import 'package:voitrure_automobile/Screens/GarageVehiType/busLorry.dart';
import 'package:voitrure_automobile/Screens/GarageVehiType/car.dart';
import 'package:voitrure_automobile/Screens/GarageVehiType/threewheel.dart';

import 'GarageVehiType/allOther.dart';

class VehiList extends StatefulWidget {
  const VehiList({Key key}) : super(key: key);

  @override
  _VehiListState createState() => _VehiListState();
}

class _VehiListState extends State<VehiList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Vehicle Type"),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text("Car"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Car()));
              }
                ),
                ),
                Card(
                child: ListTile(
                title: Text("Bike"),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Bike()));
                  },

                ),
                ),
                Card(
                child: ListTile(
                title: Text("Three Wheel"),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ThreeWheel()));
                  },

                ),
                ),
                Card(
                child: ListTile(
                title: Text("Bus / Lorry"),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BusLorry()));
                  },

                ),
                ),
                Card(
                child: ListTile(
                title: Text("All"),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AllOther()));
                  },

                ),
                ),
        ]
      ),
    );
  }
}

