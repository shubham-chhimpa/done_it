part of 'setting_bloc.dart';

abstract class SettingState extends Equatable {
  const SettingState();

  @override
  List<Object> get props => [];
}

class SettingInitial extends SettingState {}

class SettingLoadingState extends SettingState {}

class SettingLoadSuccessState extends SettingState {
  final Setting setting;

  SettingLoadSuccessState({required this.setting});

  @override
  List<Object> get props => [];
}

class SettingLoadFailState extends SettingState {}

class AppThemeModeChangeSuccessState extends SettingState {}

class AppThemeModeChangeFailState extends SettingState {}
