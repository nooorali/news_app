import 'package:flutter/material.dart';

class UnSelectedOptionWidget extends StatelessWidget {
  final String unSelectedTitle;
  const UnSelectedOptionWidget({super.key, required this.unSelectedTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        width:double.infinity ,
        decoration: BoxDecoration(
          color: Colors.white24.withOpacity(0.05),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(unSelectedTitle));
  }
}