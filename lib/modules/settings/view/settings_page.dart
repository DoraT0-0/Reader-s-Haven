import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readershaven_app/bloc/theme/theme_cubit.dart';
import 'package:settings_ui/settings_ui.dart';

@RoutePage()
class SettingsPage extends StatefulWidget {
  const SettingsPage({
    super.key,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isSTheme = context.watch<ThemeCubit>().state.isSwitched;
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        title: Text('Настройки'),
      ),
      body: SettingsList(
        darkTheme: SettingsThemeData(settingsListBackground: theme.scaffoldBackgroundColor),
        lightTheme: SettingsThemeData(settingsListBackground: theme.scaffoldBackgroundColor),
        sections: [
        SettingsSection(tiles: [
          SettingsTile.switchTile(initialValue: isSTheme, onToggle: (value) {context.read<ThemeCubit>().setTheme(value ? true : false);}, title: Text("Тёмная тема"), activeSwitchColor: theme.indicatorColor,)
        ])
      ])
       
    );
  }
}