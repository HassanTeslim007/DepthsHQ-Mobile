import 'package:flutter/material.dart';

import '../../utils/size_config.dart';
import '../../widgets/custom_button.dart';
import 'controller.dart';

class AirtimeTab extends StatefulWidget {
  const AirtimeTab({Key? key}) : super(key: key);

  @override
  State<AirtimeTab> createState() => _AirtimeTabState();
}

class _AirtimeTabState extends State<AirtimeTab> {
  @override
  Widget build(BuildContext context) {
    final controller = UtilityController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Choose a recepient'),
                SizedBox(height: SizeConfig.fromHeight(context, 1.8)),
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: controller.recepient,
                      onChanged: (value) => setState(() {
                        controller.recepient = value as int;
                      }),
                    ),
                    const Text('My Number')
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 2,
                      groupValue: controller.recepient,
                      onChanged: (value) => setState(() {
                        controller.recepient = value as int;
                      }),
                    ),
                    const Text('My Contact')
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 3,
                      groupValue: controller.recepient,
                      onChanged: (value) => setState(() {
                        controller.recepient = value as int;
                      }),
                    ),
                    const Text('New Number'),
                  ],
                ),
                SizedBox(height: SizeConfig.fromHeight(context, 1.8)),
                const Text('Enter Phone Number'),
                SizedBox(height: SizeConfig.fromHeight(context, 1.8)),
                TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Phone Number',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
              ],
            ),
            SizedBox(height: SizeConfig.fromHeight(context, 10.2)),
            // Center(
            //     child: MaterialButton(
            //   minWidth: double.infinity,
            //   height: SizeConfig.fromHeight(context, 6.05),
            //   onPressed: () {},
            //   color: const Color.fromRGBO(90, 57, 183, 1),
            //   child: const Text('Pay Now'),
            // ))
            const CustomButton(text: 'Pay Now')
          ],
        ),
      ),
    );
  }
}
