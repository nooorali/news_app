import 'package:flutter/material.dart';
import 'package:news_app/pages/settings/widgets/selected_option_widget.dart';
import 'package:news_app/pages/settings/widgets/unselected_option_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/app_provider.dart';

class LanguageBottomSheetWidget extends StatelessWidget {
  const LanguageBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var appProvider= Provider.of<AppProvider>(context);
    var theme=Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 25),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
              onTap: () {
                appProvider.changeLanguage("en");
                Navigator.pop(context);
              },
              child: appProvider.currentLocal=="en"
                  ? SelectedOptionWidget(selectedTitle: "English") : UnSelectedOptionWidget(unSelectedTitle: "English")),
          SizedBox(height: 35,),
          GestureDetector(
              onTap: () {
                appProvider.changeLanguage("ar");
                Navigator.pop(context);
              },
              child:appProvider.currentLocal=="en"?
              UnSelectedOptionWidget(unSelectedTitle: "عربي") :SelectedOptionWidget(selectedTitle: "عربي") ),
        ],
      ) ,
    );

  }
}