import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:organico/provider/bottomNavProvider.dart';
import 'package:organico/provider/eyeProvider.dart';
import 'package:organico/provider/iconColorProvider.dart';
import 'package:organico/provider/scaffolBackgroundProvider.dart';
import 'package:organico/provider/textProvider.dart';
import 'package:organico/router/router.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await Hive.openBox("mevalar");
  await Hive.openBox("meat");
  await Hive.openBox("sabzovotlar");

 runApp( MultiProvider(providers: [
   
   
   
    ChangeNotifierProvider(create: (_) => ScaffoldBackgroundProvider()),
    ChangeNotifierProvider(create: (_)=> EyeProvider()),
    ChangeNotifierProvider(create: (_)=>TextProvider()),
    ChangeNotifierProvider(create: (_)=>bottomNavProvider()),
    ChangeNotifierProvider(create: (_)=>iconColorProvider()),






  ], child: MyApp())
 );
 
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _forRouter = RouteProvider();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      onGenerateRoute: _forRouter.onGenerateRoute,
    );
  }
}
