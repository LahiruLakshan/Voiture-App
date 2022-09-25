
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../serviceProviderDetails.dart';

class ThreeWheel extends StatefulWidget {
  const ThreeWheel({Key key}) : super(key: key);

  @override
  _ThreeWheelState createState() => _ThreeWheelState();
}

class _ThreeWheelState extends State<ThreeWheel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ThreeWheel Garages"),
        backgroundColor: Colors.grey,
      ),
      body: List(),
    );
  }
}


class List extends StatefulWidget {
  const List({Key key}) : super(key: key);

  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<List> {

  Future getCarGarages() async {
    var db = FirebaseFirestore.instance;
    QuerySnapshot qn = await db.collection("provider").where("SerCat", isEqualTo: "Garage").where("VehiType", isEqualTo: "Threewheel").get();
    return qn.docs;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: getCarGarages(),
          builder: (_, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: Text("Loading..."),
              );
            }else{
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index){
                    //   final img = base64Decode(snapshot.data[index].data["Photo"]);

                    return Card(
                      child: ListTile(
                        // leading: CircleAvatar(
                        //   backgroundImage: MemoryImage(img),
                        //   radius: 25,
                        // ),
                        leading: IconButton(
                          icon: Icon(Icons.home_work_sharp, size: 40),
                        ),
                        tileColor: Colors.amber.shade200,
                        title: Text(snapshot.data[index].data()["OrgName"], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        subtitle: Text(snapshot.data[index].data()["Address"], style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                        onTap: () async {
                          var post = await FirebaseFirestore.instance.collection("provider").doc(snapshot.data[index].data()["Email"]).get().then((DocumentSnapshot snap) async {
                            print(snapshot.data[index].data()["Email"]);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProviderDetails(post: snap)));
                          });
                        }
                      ),


                    );

                  });

            }
          }),
    );
  }
}

