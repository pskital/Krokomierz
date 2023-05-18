import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ps_pedometer/data/repositories/language/lang_type.dart';

@immutable
abstract class LanguageState extends Equatable {
  const LanguageState(this.langType);

  final LanguageType langType;

  @override
  List<Object?> get props => <Object?>[langType];
}

@immutable
class SetLanguageState extends LanguageState {
  const SetLanguageState(super.langType);
}

class ChangeSystemLocalesState extends LanguageState {
  const ChangeSystemLocalesState(super.langType, this.systemLanguage);

  final String systemLanguage;

  @override
  List<Object?> get props => <Object?>[langType, systemLanguage];
}
