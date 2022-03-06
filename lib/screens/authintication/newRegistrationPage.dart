import 'package:flutter/material.dart';
import 'package:organico/constants/buttons/k_buttons.dart';
import 'package:organico/constants/containers/k_containers.dart';
import 'package:organico/constants/formfields/formField.dart';
import 'package:organico/provider/scaffolBackgroundProvider.dart';
import 'package:organico/provider/textProvider.dart';
import 'package:provider/provider.dart';

class NewRegistrationPage extends StatefulWidget {
  const NewRegistrationPage({Key? key}) : super(key: key);

  @override
  _NewRegistrationPageState createState() => _NewRegistrationPageState();
}

class _NewRegistrationPageState extends State<NewRegistrationPage> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  bool isChecked = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          context.watch<ScaffoldBackgroundProvider>().backgroundColorofScaffold,
      appBar: appBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          texts(context),
          showFullName(context),
          fullnameField(),
          showpasswordtext(context),
          const_FormFieldsForSigning.showTextFormFieldForPAsswords(
              context, _controller2, "Password"),
          passwrod_confirmation_text(context),
          const_FormFieldsForSigning.showTextFormFieldForPAsswords(
              context, _controller3, "Password confirmation"),
          acceptanceOfPrivacy(context),
          InkWell(
            highlightColor: Colors.red,
            splashColor: Colors.green,
            child: constButtonStyles.kButtonSignIn("Sign Up"),
            onTap: () {},
          ),
          orText(context),
          signUpWithGoogle()
        ],
      ),
    );
  }

  InkWell signUpWithGoogle() {
    return InkWell(
        
      child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            alignment: Alignment.center,
            height: 60.0,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                border: Border.all(color: Colors.black, width: 1)),
            child: Text("Sign Up with Google",
                style: context.watch<TextProvider>().TextDesignOpen),
          )),
      onTap: () {
        
      },
    );
  }

  Row orText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "or",
          style: context.watch<TextProvider>().TextDesignOpen,
        ),
      ],
    );
  }

  Row acceptanceOfPrivacy(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            }),
        Text("I accept the",
            style: context.watch<TextProvider>().TextDesignOpen),
        Text(
          " Termes of Use ",
          style: TextStyle(color: Colors.green, fontSize: 15),
        ),
        Text(
          "and",
          style: context.watch<TextProvider>().TextDesignOpen,
        ),
        Text(" Privacy Policy",
            style: TextStyle(color: Colors.green, fontSize: 15)),
      ],
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor:
          context.watch<ScaffoldBackgroundProvider>().backgroundColorofScaffold,
      iconTheme: IconThemeData(color: Colors.black),
      title: Text(
        "new Registration",
        style: context.watch<TextProvider>().TextDesignBold,
      ),
    );
  }

  Padding passwrod_confirmation_text(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Password confirmation",
        style: context.read<TextProvider>().TextDesignBold,
      ),
    );
  }

  Padding showpasswordtext(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Password",
        style: context.read<TextProvider>().TextDesignBold,
      ),
    );
  }

  Padding fullnameField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        controller: _controller1,
        decoration: InputDecoration(
            hintText: "Full Name",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(70)))),
      ),
    );
  }

  Padding showFullName(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Full Name",
        style: context.read<TextProvider>().TextDesignBold,
      ),
    );
  }

  Padding texts(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "It looks like you don't have an account on this number.Please let as know some information for a secure service",
        style: context.watch<TextProvider>().TextDesignOpen,
      ),
    );
  }
}
