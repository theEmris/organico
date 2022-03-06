import 'package:flutter/material.dart';
import 'package:organico/constants/appBar.dart/appBar.dart';
import 'package:organico/constants/buttons/k_buttons.dart';
import 'package:organico/constants/containers/k_containers.dart';
import 'package:organico/constants/formfields/formField.dart';
import 'package:organico/provider/scaffolBackgroundProvider.dart';
import 'package:organico/provider/textProvider.dart';
import 'package:provider/provider.dart';

import '../../sizedConfig.dart';

class InterSendedCodePage extends StatefulWidget {
  const InterSendedCodePage({Key? key}) : super(key: key);

  @override
  _InterSendedCodePageState createState() => _InterSendedCodePageState();
}

class _InterSendedCodePageState extends State<InterSendedCodePage> {
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
      backgroundColor:
          context.watch<ScaffoldBackgroundProvider>().backgroundColorofScaffold,
      appBar: ConstAppBarDesign.KAppBar(context, "OTAC Number"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Enter Authorization Code",
              style: context.watch<TextProvider>().TextDesignBold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Text("we have sent SMS to:",
                    style: context.watch<TextProvider>().TextDesignOpen),
                Text("+998997776655",
                    style: context.watch<TextProvider>().TextDesignBold),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Resend Code",
                    style: TextStyle(color: Colors.green, fontSize: 15),
                  ))
            ],
          ),
          const_FormFieldsForSigning.showTextFormFieldPasswordWithoutLock(
              context, _controller, "6 Digit Code"),
          InkWell(
            child: constButtonStyles.kButtonSignIn("next"),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(context, "/vegitablesPage", (route) => false);
            },
          )
        ],
      ),
    );
  }
}
