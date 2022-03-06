import 'package:flutter/material.dart';
import 'package:organico/provider/scaffolBackgroundProvider.dart';
import 'package:organico/provider/textProvider.dart';
import 'package:provider/provider.dart';
class ConstAppBarDesign{

  static  KAppBar (BuildContext context, String givenTitle) => AppBar(
         elevation: 0,
      backgroundColor:
          context.watch<ScaffoldBackgroundProvider>().backgroundColorofScaffold,
      iconTheme: IconThemeData(color: Colors.black),
      title:Text(
       givenTitle,
         style: context.watch<TextProvider>().TextDesignBold,
      ),
      );
  
}