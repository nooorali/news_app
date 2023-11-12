import 'package:flutter/material.dart';

typedef SettingsOptionClicked= void Function();
class SettingsItem extends StatelessWidget {
  final String settingOptionTitle;
  final SettingsOptionClicked onOptionTap;
  final String choosedOption;
  SettingsItem({super.key, required this.settingOptionTitle, required this.onOptionTap, required this.choosedOption});

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    var mediaQuery=MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(settingOptionTitle,
          style: theme.textTheme.bodyLarge,
          textAlign:TextAlign.start,
        ),
        InkWell(
          onTap: onOptionTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
            height: 50,
            width: mediaQuery.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: theme.primaryColor,
                  width: 1.2,
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(choosedOption),
                Icon(Icons.arrow_drop_down,color: theme.primaryColor,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
