
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voitrure_automobile/Screens/SparePartsVehiTypes/bikeSpareParts.dart';
import 'package:voitrure_automobile/Screens/SparePartsVehiTypes/busLorrySpareParts.dart';
import 'package:voitrure_automobile/Screens/SparePartsVehiTypes/threeWheelSpareParts.dart';
import 'SparePartsVehiTypes/carSpareParts.dart';

class VehiSparePartsList extends StatefulWidget {
  const VehiSparePartsList({Key key}) : super(key: key);

  @override
  _VehiSparePartsListState createState() => _VehiSparePartsListState();
}

class _VehiSparePartsListState extends State<VehiSparePartsList> {
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CarSpareParts()));
                  }
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Bike"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BikeSpareParts()));
                },

              ),
            ),
            Card(
              child: ListTile(
                title: Text("Wheel"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ThreeWheelSpareParts()));
                },

              ),
            ),
            Card(
              child: ListTile(
                title: Text("Bus / Lorry"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BusLorySpareParts()));
                },

              ),
            ),
          ]
      ),
    );
  }
}

