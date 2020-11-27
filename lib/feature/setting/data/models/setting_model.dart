import 'package:done_it/feature/setting/domain/entities/setting.dart';
import 'package:flutter/material.dart';

class SettingModel extends Setting {
  final AppThemeMode appThemeMode;

  SettingModel({@required this.appThemeMode})
      : super(appThemeMode: appThemeMode);

  SettingModel copyWith({AppThemeMode appThemeMode}) {
    return SettingModel(
      appThemeMode: appThemeMode ?? this.appThemeMode,
    );
  }
}
