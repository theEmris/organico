import 'package:flutter/material.dart';
import 'package:organico/constants/bottomNavigationBar/bottonNavigationBArItems.dart';
import 'package:organico/screens/authintication/forgotPasswordPage.dart';
import 'package:organico/screens/authintication/interSendedCode.dart';
import 'package:organico/screens/authintication/intrancePage.dart';
import 'package:organico/screens/authintication/newRegistrationPage.dart';
import 'package:organico/screens/authintication/welcomPage.dart';
import 'package:organico/screens/base/fruitsPage.dart';
import 'package:organico/screens/base/meatPage.dart';
import 'package:organico/screens/base/vegitablesPage.dart';

class RouteProvider {
  Route? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => IntrancePage());
      case "/welcomePage":
        return MaterialPageRoute(builder: (context) => WelcomePage());
      case "/fruitsPage":
        return MaterialPageRoute(builder: (context) => fruitsPage());
      case "/meatPage":
        return MaterialPageRoute(builder: (context) => meatPage());
      case "/vegitablesPage":
        return MaterialPageRoute(builder: (context) => vegitablesPage());
      case "/new_registration":
        return MaterialPageRoute(builder: (context) => NewRegistrationPage());
      case "/forgot_password_page":
        return MaterialPageRoute(builder: (context) => ForGotPasswordPage());
      case "/code_inter_page":
        return MaterialPageRoute(builder: (context) => InterSendedCodePage());
      case "/bottomNavForPages":
        return MaterialPageRoute(builder: (context)=> BottomNavigationBArForPages());
    }
  }
}
