part of 'setting_bloc.dart';

abstract class SettingEvent extends Equatable {
  const SettingEvent();

  @override
  List<Object> get props => [];
}

class LoadSettingEvent extends SettingEvent {}

class ChangeAppThemeModeEvent extends SettingEvent {
  final AppThemeMode appThemeMode;

  ChangeAppThemeModeEvent({required this.appThemeMode});
}
