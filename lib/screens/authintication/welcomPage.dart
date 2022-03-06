import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:organico/provider/textProvider.dart';
import 'package:organico/constants/buttons/k_buttons.dart';
import 'package:organico/constants/formfields/formField.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  String dropDownValue = "+1";

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller1.dispose();
    _controller2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            showThePhoto(context),
            ShowTheTexts(),
            const_FormFieldsForSigning.ShowTextFormFieldWithFlag(
                context, dropDownValue, _controller1, "your phone number"),
            SizedBox(
              height: 10,
            ),
            const_FormFieldsForSigning.showTextFormFieldForPAsswords(
                context, _controller2, "password"),
            pushToTheAnotherPage(context),
            InkWell(
              child: constButtonStyles.kButtonSignIn("Sign in"),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/bottomNavForPages", (route) => false);
              },
            ),
            constButtonStyles.kButtonSignIn("Sign Up"),
          ],
        ),
      ],
    ));
  }

  Row pushToTheAnotherPage(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "/forgot_password_page");
            },
            child: Text(
              "forgot password",
              style: TextStyle(color: Colors.green),
            )),
      ],
    );
  }

  Column ShowTheTexts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "Welcome",
            style: context.watch<TextProvider>().TextDesignBold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "Welcome to Organico Mobile Apps.Please fill in the field below to sign in",
            style: context.watch<TextProvider>().TextDesignOpen,
          ),
        ),
      ],
    );
  }

  SizedBox showThePhoto(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: SvgPicture.asset("assets/Welcome_Illustration.svg"),
    );
  }
}
