import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:organico/constants/appBar.dart/appBar.dart';
import 'package:organico/constants/buttons/k_buttons.dart';
import 'package:organico/constants/formfields/formField.dart';
import 'package:organico/provider/textProvider.dart';
import 'package:organico/service/SignwithPhoneNumber.dart';
import 'package:provider/provider.dart';

import '../../provider/scaffolBackgroundProvider.dart';

class ForGotPasswordPage extends StatefulWidget {
  const ForGotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForGotPasswordPageState createState() => _ForGotPasswordPageState();
}

class _ForGotPasswordPageState extends State<ForGotPasswordPage> {
  TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context
            .watch<ScaffoldBackgroundProvider>()
            .backgroundColorofScaffold,
        appBar: ConstAppBarDesign.KAppBar(context, "forgot Password"),
        body: ListView(
          children: [body(context)],
        ));
  }

  Container body(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: SvgPicture.asset("assets/Forgot_Illustration.svg"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "Enter your phone Number",
              style: context.watch<TextProvider>().TextDesignBold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "We need to verify you. We will send you a one-time authorization code",
              style: context.watch<TextProvider>().TextDesignOpen,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.05),
            child: const_FormFieldsForSigning.ShowTextFormFieldWithFlag(
                context, "+1", _controller, "Your Phone Number"),
          ),
          InkWell(
            child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.07),
                child: constButtonStyles.kButtonSignIn("Next")),
            onTap: () async{
              await SingingWithPhoneNumber.Verifysms(_controller.text).then((value){
              Navigator.pushNamed(context, "/code_inter_page");
              });
            },
          )
        ],
      ),
    );
  }
}
