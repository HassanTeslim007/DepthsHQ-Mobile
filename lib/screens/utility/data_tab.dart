import 'package:flutter/material.dart';

import '../../utils/size_config.dart';
import '../../widgets/custom_button.dart';
import 'controller.dart';
import 'utilities.dart';

class DataTab extends StatefulWidget {
  const DataTab({Key? key}) : super(key: key);

  @override
  State<DataTab> createState() => _DataTabState();
}

class _DataTabState extends State<DataTab> {
  final controller = UtilityController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Choose a Data Plan'),
                SizedBox(height: SizeConfig.fromHeight(context, 1.8)),
                Container(
                  padding: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromRGBO(158, 158, 158, 1)),
                      borderRadius: BorderRadius.circular(15)),
                  child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white))),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      iconSize: SizeConfig.fontSize(context, 5),
                      hint: const Text('Select Account'),
                      isExpanded: true,
                      onChanged: (plan) {
                        controller.plan = plan!;
                      },
                      items: controller.dataPlan
                          .map((item) => buildMenuItem(item))
                          .toList()),
                ),
                SizedBox(height: SizeConfig.fromHeight(context, 1.8)),
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
                SizedBox(height: SizeConfig.fromHeight(context, 1.8)),
                const Text('Dashr Friends'),
                SizedBox(height: SizeConfig.fromHeight(context, 1.8)),
                SizedBox(
                    height: SizeConfig.fromHeight(context, 14),
                    width: double.infinity,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.friends.length,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    SizeConfig.fromWidth(context, 2.17)),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor:
                                        const Color.fromRGBO(90, 57, 183, 1),
                                    radius: SizeConfig.fontSize(context, 8),
                                    child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: SizeConfig.fontSize(context, 7),
                                        child: Image.asset(
                                          controller.friends[index].image,
                                          width: SizeConfig.fromWidth(
                                              context, 6.17),
                                          height: SizeConfig.fromHeight(
                                              context, 3.2),
                                        )),
                                  ),
                                  Text(controller.friends[index].name,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              SizeConfig.fontSize(context, 3),
                                          fontWeight: index == 0
                                              ? FontWeight.bold
                                              : FontWeight.w400))
                                ]),
                          );
                        })))
              ],
            ),
            SizedBox(height: SizeConfig.fromHeight(context, 5.2)),
            const CustomButton(text: 'Pay Now')
          ],
        ),
      ),
    );
  }
}
