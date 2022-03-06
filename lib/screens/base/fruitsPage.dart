import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:organico/provider/textProvider.dart';
import 'package:organico/constants/buttons/k_buttons.dart';
import 'package:organico/constants/columns/columnOfContainer.dart';
import 'package:organico/constants/containers/k_containers.dart';
import 'package:organico/constants/instants/cloudfireStoreinstance.dart';
import 'package:organico/provider/scaffolBackgroundProvider.dart';
import 'package:organico/sizedConfig.dart';
import 'package:provider/provider.dart';

class fruitsPage extends StatefulWidget {
  const fruitsPage({Key? key}) : super(key: key);

  @override
  _fruitsPageState createState() => _fruitsPageState();
}

List choosedList = [];
List vege = [];

class _fruitsPageState extends State<fruitsPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: context
            .read<ScaffoldBackgroundProvider>()
            .backgroundColorofScaffold,
        body: funksiya());
  }

  StreamBuilder<QuerySnapshot<Map<String, dynamic>>> funksiya() {
    return StreamBuilder(
        stream:
            cloudfireStoreinstance.firestore.collection("mevalar").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator.adaptive();
          } else if (snapshot.hasError) {
            return Center(
              child: Text("no data"),
            );
          } else {
            var data = snapshot.data!.docs;
            Hive.box("mevalar").put(0, data);
            vege.clear();
            vege.add(Hive.box("mevalar").values.toList()[0]);

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 22,
                    mainAxisExtent: 252,
                    crossAxisSpacing: 22),
                itemBuilder: (context, index) {
                  return ContsContainers.kconatinerShowForGridView(
                      columnOfContainerChild.showChildColumnOfContainer(
                          vege, index, choosedList,context));
                },
                itemCount: snapshot.data!.docs.length,
              ),
            );
          }
        });
  }

  Padding yeslichoQaytaman(int index) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: vege[0][index]['image'],
            height: 79,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                vege[0][index]['name'],
                style: context.watch<TextProvider>().TextDesignBold,
              ),
              Text(vege[0][index]['desc'],
                  style: context.watch<TextProvider>().TextDesignOpen),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${vege[0][index]['price']}/kg',
                style: context.watch<TextProvider>().TextDesignBold,
              ),
              constButtonStyles.kButtonAdd
            ],
          ),
        ],
      ),
    );
  }
}
