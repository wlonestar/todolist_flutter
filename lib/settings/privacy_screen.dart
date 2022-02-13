import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

import 'package:todolist/common/constants.dart';

class PrivacyScreen extends StatefulWidget {
  @override
  _PrivacyScreenState createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool _required;
  bool _optional;

  @override
  void initState() {
    super.initState();
    _required = true;
    _optional = false;
  }

  void changeRequired(required) {
    setState(() {
      _required = required;
    });
  }

  void changeOptional(optional) {
    setState(() {
      _optional = optional;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(privacy),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            tiles: [
              SettingsTile(
                title: const Text('Send required diagnostic data'),
                trailing: Switch(
                  value: _required,
                  onChanged: changeRequired,
                ),
              ),
              SettingsTile(
                title: null,
                value: const Text(sendRequiredData),
              ),
              SettingsTile(
                title: const Text('Send optional diagnostic data'),
                trailing: Switch(
                  value: _optional,
                  onChanged: changeOptional,
                ),
              ),
              SettingsTile(
                title: null,
                value: const Text(sendOptionalData),
              ),
              SettingsTile(
                title: const Text(
                  '© 2022 Lonestar. All rights reserved',
                  style: TextStyle(
                      fontWeight: FontWeight.w300, color: Colors.grey),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
