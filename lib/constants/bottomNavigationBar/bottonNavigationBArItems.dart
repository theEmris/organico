import 'package:flutter/material.dart';
import 'package:organico/provider/bottomNavProvider.dart';
import 'package:organico/provider/iconColorProvider.dart';
import 'package:organico/provider/scaffolBackgroundProvider.dart';
import 'package:organico/screens/mainScreens/widgets/listOfPageNames.dart';
import 'package:provider/provider.dart';

class BottomNavigationBArForPages extends StatefulWidget {
  const BottomNavigationBArForPages({Key? key}) : super(key: key);

  @override
  _BottomNavigationBArForPagesState createState() =>
      _BottomNavigationBArForPagesState();
}

class _BottomNavigationBArForPagesState
    extends State<BottomNavigationBArForPages> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          context.watch<ScaffoldBackgroundProvider>().backgroundColorofScaffold,
      body: PageNames
          .pageNames[context.watch<bottomNavProvider>().selectedPagenumber],
      bottomNavigationBar: BottomNavigationBar(
           unselectedItemColor: Colors.black,
        elevation: 0.1,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "home",
              backgroundColor: context
                  .watch<ScaffoldBackgroundProvider>()
                  .backgroundColorofScaffold),
          BottomNavigationBarItem(
              backgroundColor: context
                  .watch<ScaffoldBackgroundProvider>()
                  .backgroundColorofScaffold,
              icon: Icon(
                Icons.search_outlined,
              ),
              label: "explore"),
          BottomNavigationBarItem(
              backgroundColor: context
                  .watch<ScaffoldBackgroundProvider>()
                  .backgroundColorofScaffold,
              icon: Icon(
                Icons.shopping_cart_outlined,
              ),
              label: "card"),
          BottomNavigationBarItem(
              backgroundColor: context
                  .watch<ScaffoldBackgroundProvider>()
                  .backgroundColorofScaffold,
              icon: Icon(
                Icons.person_outlined,
              ),
              label: "profile"),
        ],
        currentIndex: context.watch<bottomNavProvider>().selectedPagenumber,
        selectedIconTheme: IconThemeData(color: Colors.green, size: 33),
        selectedItemColor: Colors.greenAccent,
        onTap: context.read<bottomNavProvider>().onItemTapped,
      ),
    );
  }
}
