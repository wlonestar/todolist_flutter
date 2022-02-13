import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int languageIndex = 0;

  Widget trailingWidget(int index) {
    return (languageIndex == index)
        ? const Icon(
            Icons.check,
            color: Colors.blue,
          )
        : const Icon(null);
  }

  void changeLanguage(int index) {
    setState(() {
      languageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('language'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            tiles: [
              SettingsTile(
                title: const Text("English"),
                trailing: trailingWidget(0),
                onPressed: (BuildContext context) {
                  changeLanguage(0);
                },
              ),
              SettingsTile(
                title: const Text("中文"),
                trailing: trailingWidget(1),
                onPressed: (BuildContext context) {
                  changeLanguage(1);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
