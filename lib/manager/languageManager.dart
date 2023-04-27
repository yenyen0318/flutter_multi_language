import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final languageProvider = StateNotifierProvider<LanguageNotifier, Locale>((ref) {
  return LanguageNotifier(ref);
});

class LanguageNotifier extends StateNotifier<Locale> {
  LanguageNotifier(this.ref) : super(_initialValue);

  final Ref ref;
  static const _initialValue = Locale.fromSubtags(languageCode: 'zh');

  void changeLanguage(Locale locale) {
    state = locale;
  }
}
