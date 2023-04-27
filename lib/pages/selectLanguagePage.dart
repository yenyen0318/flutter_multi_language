import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../manager/languageManager.dart';

class SelectLanguagePage extends HookConsumerWidget {
  const SelectLanguagePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).languageChange)),
      body: ListView(
        children: [
          ListTile(
            title: Text(AppLocalizations.of(context).languageEn),
            onTap: () {
              debugPrint('「功能-切換語系」:切換為英文');
              ref
                  .read(languageProvider.notifier)
                  .changeLanguage(const Locale('en'));
            },
          ),
          ListTile(
            title: Text(AppLocalizations.of(context).languageZh),
            onTap: () {
              debugPrint('「功能-切換語系」:切換為中文');
              ref
                  .read(languageProvider.notifier)
                  .changeLanguage(const Locale('zh'));
            },
          )
        ],
      ),
    );
  }
}
