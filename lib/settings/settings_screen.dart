import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

import 'package:todolist/settings/language_screen.dart';
import 'package:todolist/settings/privacy_screen.dart';
import 'package:todolist/common/constants.dart';
import 'package:todolist/util/link.dart';

class SettingsScreen extends StatefulWidget {

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  Widget _buildSettingsList() {
    return SettingsList(
      sections: [
        SettingsSection(
          tiles: [
            SettingsTile(
              title: const Text('admin'),
              leading: const Icon(Icons.account_circle_outlined),
              description: const Text('admin@todo.com'),
            ),
          ],
        ),
        SettingsSection(
          title: const Text('About', style: TextStyle(color: Colors.blue),),
          tiles: [
            // SettingsTile(
            //   title: const Text('Language'),
            //   description: const Text('English'),
            //   leading: const Icon(Icons.language),
            //   onPressed: (context) {
            //     Navigator.of(context).push(MaterialPageRoute(
            //       builder: (_) => LanguageScreen(),
            //     ));
            //   },
            // ),
            SettingsTile(
              title: const Text(privacy),
              onPressed: (context) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => PrivacyScreen(),
                ));
              },
            ),
            SettingsTile(
              title: const Text(version),
              description: const Text('1.1.0'),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(setting),),
      body: _buildSettingsList(),
    );
  }

}

