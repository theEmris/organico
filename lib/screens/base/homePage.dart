import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:organico/provider/scaffolBackgroundProvider.dart';
import 'package:organico/provider/textProvider.dart';
import 'package:provider/provider.dart';
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ScaffoldBackgroundProvider>().backgroundColorofScaffold,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: context.watch<ScaffoldBackgroundProvider>().backgroundColorofScaffold,
          flexibleSpace: FlexibleSpaceBar(
          
            background: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Column(children: [
                Text("your location",style: context.watch<TextProvider>().TextDesignOpen),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Text("Bandung,Climahi",style: context.watch<TextProvider>().TextDesignBold,)
              ,Icon(Icons.keyboard_arrow_down_outlined)
              ],),
              ],),

            textformfield(),


            cupon(context),



            ],),          ),
            expandedHeight: MediaQuery.of(context).size.height*0.4,
          ),


      ],)
      ,
    );
  }

  ListTile cupon(BuildContext context) {
    return ListTile(
            leading: SvgPicture.asset("assets/Icon.svg"),
            title: Text("you have 3 coupon",style: context.watch<TextProvider>().TextDesignBold),
            subtitle: Text("Let's use this coupon",style: context.watch<TextProvider>().TextDesignOpen),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          );
  }

  Padding textformfield() {
    return Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(60)),
                ),
                prefixIcon: Icon(Icons.search),
                hintText: "search anything here"
              ),
            ),
          );
  }
}