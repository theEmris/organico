import 'package:flutter/cupertino.dart';

class ContsContainers {

  
  static kconatinerShowForGridView (Widget value) {
    return Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFEBEAF3),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                   child: value,
                  );
  }
  
}

