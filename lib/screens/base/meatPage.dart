import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:organico/constants/columns/columnOfContainer.dart';
import 'package:organico/constants/containers/k_containers.dart';
import 'package:organico/constants/instants/cloudfireStoreinstance.dart';

class meatPage extends StatefulWidget {
  const meatPage({Key? key}) : super(key: key);

  @override
  _meatPageState createState() => _meatPageState();
}

class _meatPageState extends State<meatPage> {
  List info = [];
  List choosedList = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("meat page"),
      ),
      body: StreamBuilder(
        stream: cloudfireStoreinstance.firestore.collection("meat").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator.adaptive();
          } else if (snapshot.hasError) {
            return Center(
              child: Text("has not data"),
            );
          } else {
            var data = snapshot.data!.docs;
            Hive.box("meat").put(0, data);
            info.clear();
            info.add(Hive.box("meat").values.toList()[0]);
            return Padding(padding: EdgeInsets.symmetric(horizontal: 20)
            ,child: GridView.builder(
               physics: const BouncingScrollPhysics(),
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,  
                    mainAxisSpacing: 22,
                    mainAxisExtent: 252,
                    crossAxisSpacing: 22
                 
                 ),
               itemBuilder: (context, index){
                 return ContsContainers.kconatinerShowForGridView(
                   columnOfContainerChild.showChildColumnOfContainer(info, index, choosedList,context)
                 );
               },itemCount: snapshot.data!.docs.length,
            ));
          }
        },
      ),
    );
  }
}
