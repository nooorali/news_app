import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/pages/settings/widgets/language_bottomsheet_widget.dart';
import 'package:news_app/pages/settings/widgets/setting_item.dart';
import 'package:provider/provider.dart';

import '../../core/provider/app_provider.dart';

class SettingsView extends StatefulWidget {
  static const String routeName="settings";
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    var local=AppLocalizations.of(context)!;
    var appProvider=Provider.of<AppProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage("assets/images/pattern.png"),fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SettingsItem(
                settingOptionTitle:local.language,
                onOptionTap:(){
                  showLanguageBottomSheet(context);
                },
                choosedOption:appProvider.currentLocal=="en" ?"English" : "عربي" ,),
              const SizedBox(height: 40,),

            ],),
        ),
      ),
    );
  }

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(context: context, builder: (context) => const LanguageBottomSheetWidget(),);
  }

}