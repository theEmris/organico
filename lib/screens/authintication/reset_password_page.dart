import 'package:flutter/material.dart';
import 'package:organico/constants/appBar.dart/appBar.dart';
import 'package:organico/constants/buttons/k_buttons.dart';
import 'package:organico/constants/formfields/formField.dart';
import 'package:organico/provider/scaffolBackgroundProvider.dart';
import 'package:organico/provider/textProvider.dart';
import 'package:provider/provider.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({ Key? key }) : super(key: key);

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ScaffoldBackgroundProvider>().backgroundColorofScaffold,
      appBar: ConstAppBarDesign.KAppBar(context, "Reset Password"),
      body: Column(children: [
        Text("Please fill in the field below to reset your current password",style: context.watch<TextProvider>().TextDesignOpen),
        Padding(padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text("New Password",style: context.watch<TextProvider>().TextDesignBold,),),
       const_FormFieldsForSigning.showTextFormFieldPasswordWithoutLock(context, _controller1, "New Password"),
        Padding(padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text("New Password Confirmation",style: context.watch<TextProvider>().TextDesignBold,),),
        const_FormFieldsForSigning.showTextFormFieldPasswordWithoutLock(context, _controller2, "New Password Confirmation"),
        InkWell(
          child: constButtonStyles.kButtonSignIn("Reset password"),
          onTap: (){},
        )
      ],),
    );
  }
}