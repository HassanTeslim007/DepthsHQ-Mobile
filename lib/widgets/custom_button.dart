import 'package:flutter/material.dart';

import '../utils/size_config.dart';

class CustomButton extends StatelessWidget {
  final String text;
  const CustomButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: SizeConfig.fromHeight(context, 6.05),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(90, 57, 183, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: Text(text, style: const TextStyle(color: Colors.white))));
  }
}
