import 'package:flutter/material.dart';
import 'package:ps_pedometer/data/repositories/language/lang_type.dart';

abstract class LanguageEvent {}

@immutable
class SetLanguageEvent implements LanguageEvent {
  const SetLanguageEvent({required this.langType});

  final LanguageType? langType;
}

@immutable
class ChangeSystemLanguageEvent implements LanguageEvent {
  const ChangeSystemLanguageEvent();
}
