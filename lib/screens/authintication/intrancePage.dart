import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:organico/provider/scaffolBackgroundProvider.dart';
import 'package:organico/sizedConfig.dart';

class IntrancePage extends StatefulWidget {
  const IntrancePage({Key? key}) : super(key: key);

  @override
  _IntrancePageState createState() => _IntrancePageState();
}

class _IntrancePageState extends State<IntrancePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) => Navigator.pushReplacementNamed(context, "/welcomePage"));
  }
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(

      backgroundColor: ScaffoldBackgroundProvider().backgroundColorofScaffold,
      body: Center(
        child:SvgPicture.asset("assets/Logo.svg",
          height: MySizedConfig.getHight(context, 203),
          width: MySizedConfig.getWidth(context, 143),

        ),
      ),
    );
  }
}
