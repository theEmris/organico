import 'package:flutter/material.dart';

class EyeProvider extends ChangeNotifier {
  bool ObsecureText = true;
  Icon ButtonEye = Icon(Icons.remove_red_eye);

  chageToSeeziable() {
    ObsecureText = !ObsecureText;
    ButtonEye = Icon( ObsecureText == true ? Icons.visibility_off: Icons.remove_red_eye);
    notifyListeners();
  }
}
