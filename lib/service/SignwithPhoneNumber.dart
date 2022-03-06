import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:organico/constants/instants/fireBAseAuthinstance.dart';




class SingingWithPhoneNumber {
    static Future Verifysms(String phoneNumber) async {
    await FirebaseAuthInstance.auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (v) {
          print("verification completed");
        },
        verificationFailed: (v) {
          print("verification failed");
        },
        codeSent:(verificatonId, resendToken) async {
          debugPrint("code is sent");
          String smsCode = '112233';
          PhoneAuthCredential myphoneAuthCredential = PhoneAuthProvider.credential(
            verificationId:verificatonId,
            smsCode:smsCode,
          );
        } ,
        codeAutoRetrievalTimeout: (verifcationId){});
  }
}
