import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../drawer_view.dart';
import '../data/settings_db.dart';

/// Builds a page allowing the user to toggle between dark and light themes.
class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  static const routeName = '/settings';

  /// Update the ThemeMode based on the user's selection.
  void updateThemeMode(ThemeMode? newThemeMode, WidgetRef ref) {
    if (newThemeMode == null) return;
    // Do not perform any work if new and old ThemeMode are identical
    if (newThemeMode == ref.read(currentThemeModeProvider)) return;
    // Otherwise, store the new ThemeMode in memory
    ref.read(currentThemeModeProvider.notifier).setThemeMode(newThemeMode);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Update the page if theme mode changes.
    ref.watch(currentThemeModeProvider);
    return Scaffold(
      drawer: const DrawerView(),
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: DropdownButton<ThemeMode>(
          value: ref.read(currentThemeModeProvider),
          onChanged: (ThemeMode? newThemeMode) =>
              updateThemeMode(newThemeMode, ref),
          items: const [
            DropdownMenuItem(
              value: ThemeMode.system,
              child: Text('System Theme'),
            ),
            DropdownMenuItem(
              value: ThemeMode.light,
              child: Text('Light Theme'),
            ),
            DropdownMenuItem(
              value: ThemeMode.dark,
              child: Text('Dark Theme'),
            )
          ],
        ),
      ),
    );
  }
}
