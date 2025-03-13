import 'package:db_series1/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: Consumer<ThemeProvider>(builder: (ctx, provider, _) {
          return SwitchListTile.adaptive(
              title: Text("Dark Mode"),
              subtitle: Text("Enable dark mode"),
              onChanged: (value) {
                provider.updateTheme(value: value);
              },
              value: provider.getThemeValue(),);
        }));
  }
}
