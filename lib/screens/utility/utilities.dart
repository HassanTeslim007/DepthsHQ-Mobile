import 'dart:developer';

import 'package:flutter/material.dart';

import '../../utils/size_config.dart';
import 'airtime_tab.dart';
import 'controller.dart';
import 'data_tab.dart';

class UtilityScreen extends StatefulWidget {
  const UtilityScreen({Key? key}) : super(key: key);

  @override
  State<UtilityScreen> createState() => _UtilityScreenState();
}

class _UtilityScreenState extends State<UtilityScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final controller = UtilityController();
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.fromWidth(context, 5.6)),
              child: Column(children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: SizeConfig.fromWidth(context, 9.35),
                        height: SizeConfig.fromWidth(context, 9.35),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(114, 76, 249, 0.1)),
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.fromWidth(context, 21.45),
                    ),
                    Text(
                      'Airtime & Data',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: SizeConfig.fontSize(context, 4),
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox()
                  ],
                ),
                SizedBox(height: SizeConfig.fromHeight(context, 2.5)),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.05),
                              offset: Offset(2, 4),
                              blurRadius: 32,
                              spreadRadius: 0),
                        ]),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TabBar(
                          controller: tabController,
                          labelColor: Colors.white,
                          indicatorColor: Colors.white,
                          unselectedLabelColor: Colors.grey[500],
                          indicator: BoxDecoration(
                              color: const Color.fromRGBO(90, 57, 183, 1),
                              borderRadius:
                                  BorderRadius.circular(5)), // BoxDecoration
                          tabs: const [
                            Tab(text: 'Airtime'),
                            Tab(text: 'Data'),
                          ]),
                    )),
                SizedBox(height: SizeConfig.fromHeight(context, 1.8)),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text('Select Network'),
                  SizedBox(height: SizeConfig.fromHeight(context, 1.8)),
                  SizedBox(
                      height: SizeConfig.fromHeight(context, 7.8),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.networks.length,
                          itemBuilder: (context, index) {
                            return NetworkTiles(
                              index,
                              network: controller.networks[index],
                              onTap: () {
                                log(index.toString());
                              },
                            );
                          })),
                SizedBox(height: SizeConfig.fromHeight(context, 1.8)),
                const Text('Select Account'),
                SizedBox(height: SizeConfig.fromHeight(context, 1.8)),
                Container(
                  padding: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromRGBO(158, 158, 158, 1)),
                      borderRadius: BorderRadius.circular(15)),
                  child: DropdownButton<String>(
                      underline: null,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      iconSize: SizeConfig.fontSize(context, 5),
                      hint: const Text('Select Account'),
                      isExpanded: true,
                      onChanged: (account) {
                        controller.account = account!;
                      },
                      items: controller.accounts
                          .map((item) => buildMenuItem(item))
                          .toList()),
                ),]),
                Expanded(
                    child: TabBarView(
                        controller: tabController,
                        children: const [AirtimeTab(), DataTab()])),
              ])),
        ));
  }
}

class NetworkTiles extends StatelessWidget {
  final int index;
  final String network;
  final Function() onTap;
  const NetworkTiles(this.index,
      {Key? key, required this.network, required this.onTap})
      : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border:
                  Border.all(color: const Color.fromRGBO(158, 158, 158, 1))),
          margin: EdgeInsets.symmetric(
            horizontal: SizeConfig.fromWidth(context, 2.8),
          ),
          height: SizeConfig.fromHeight(context, 7.5),
          width: SizeConfig.fromWidth(context, 16.27),
          padding: EdgeInsets.symmetric(
            horizontal: index == 2
                ? SizeConfig.fromWidth(context, 5.3)
                : SizeConfig.fromWidth(context, 3.8),
          ),
          child: Image.asset(
            network,
          )),
    );
  }
}

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(
      item,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    ));
