import 'package:flutter/material.dart';
import 'package:organico/provider/eyeProvider.dart';
import 'package:organico/sizedConfig.dart';
import 'package:provider/provider.dart';

class const_FormFieldsForSigning {
  static ShowTextFormFieldWithFlag(BuildContext context, String dropDownValue,
          TextEditingController controller1, String hintText) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: Row(
            children: [
              Container(
                height: 50,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        MySizedConfig.getHight(context, 200),
                      ),
                      bottomLeft: Radius.circular(
                        MySizedConfig.getHight(context, 200),
                      ),
                    )),
                child: DropdownButton(
                  value: dropDownValue,
                  style: const TextStyle(color: Colors.deepPurple),
                  onChanged: (String? newValue) {
                    dropDownValue = newValue!;
                  },
                  items: <String>['+1', '+9', '+7', '+3']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Container(
                width: 270,
                height: 100,
                child: TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: controller1,
                    decoration: InputDecoration(
                      hintText: hintText,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                        topRight: Radius.circular(
                          MySizedConfig.getHight(context, 200),
                        ),
                        bottomRight: Radius.circular(
                          MySizedConfig.getHight(context, 200),
                        ),
                      )),
                    )),
              ),
            ],
          ),
        ),
      );

  static showTextFormFieldForPAsswords(BuildContext context,
          TextEditingController controller2, String hintText) =>
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MySizedConfig.getHight(context, 20)),
        child: TextFormField(
            controller: controller2,
            obscureText: context.watch<EyeProvider>().ObsecureText,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    context.read<EyeProvider>().chageToSeeziable();
                  },
                  icon: context.watch<EyeProvider>().ButtonEye),
              hintText: hintText,
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(MySizedConfig.getHight(context, 200)))),
            )),
      );

  static showTextFormFieldPasswordWithoutLock(BuildContext context, TextEditingController controller, String stringForHintText) => Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextFormField(
            obscureText: context.watch<EyeProvider>().ObsecureText,
          controller: controller,
          
            decoration: InputDecoration(
               suffixIcon: IconButton(
                  onPressed: () {
                    context.read<EyeProvider>().chageToSeeziable();
                  }, icon:context.watch<EyeProvider>().ButtonEye ,),
          hintText: stringForHintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(MySizedConfig.getHight(context, 200)),
            ),
          ),
        )),
      );
}
