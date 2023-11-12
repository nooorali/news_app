import 'package:flutter/material.dart';

class SelectedOptionWidget extends StatelessWidget {
  final String selectedTitle;
  const SelectedOptionWidget({super.key, required this.selectedTitle});

  @override
  Widget build(BuildContext context) {
    var theme= Theme.of(context);
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: theme.primaryColor,
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(selectedTitle),
          Icon(Icons.check,color:Colors.white ,),
        ],
      ),
    );
  }
}