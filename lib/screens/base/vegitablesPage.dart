import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:organico/constants/columns/columnOfContainer.dart';
import 'package:organico/constants/containers/k_containers.dart';
import 'package:organico/constants/instants/cloudfireStoreinstance.dart';

class vegitablesPage extends StatefulWidget {
  const vegitablesPage({Key? key}) : super(key: key);

  @override
  _vegitablesPageState createState() => _vegitablesPageState();
}

class _vegitablesPageState extends State<vegitablesPage> {
  List info = [];
  List choosedList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("vegitables page"),
      ),
      body: StreamBuilder(
        stream: cloudfireStoreinstance.firestore
            .collection("sabzavotlar")
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snap) {
          if (!snap.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );

            ;
          } else if (snap.hasError) {
            return Center(
              child: Text("check your net"),
            );
          } else {
            var data = snap.data!.docs;
            Hive.box("sabzovotlar").put(0, data);
            info.clear();
            info.add(Hive.box("sabzovotlar").values.toList()[0]);
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 22,
                      mainAxisExtent: 252,
                      crossAxisSpacing: 22),
                  itemBuilder: (context, index) {
                    return ContsContainers.kconatinerShowForGridView(
                      columnOfContainerChild.showChildColumnOfContainer(info, index, choosedList,context)
                    );
                  },itemCount: snap.data!.docs.length,),
            );
          }
        },
      ),
    );
  }
}
