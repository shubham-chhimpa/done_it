import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:done_it/core/usecases/usecase.dart';
import 'package:done_it/feature/setting/domain/entities/setting.dart';
import 'package:done_it/feature/setting/domain/usecases/change_app_theme_mode.dart';
import 'package:done_it/feature/setting/domain/usecases/get_setting.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'setting_event.dart';

part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc({@required this.changeAppThemeMode, @required this.getSetting})
      : super(SettingInitial());
  final GetSetting getSetting;
  final ChangeAppThemeMode changeAppThemeMode;

  @override
  Stream<SettingState> mapEventToState(
      SettingEvent event,
      ) async* {
    if (event is LoadSettingEvent) {
      yield SettingLoadingState();
      final getSettingFailedOrSuccess = await getSetting(NoParams());
      yield getSettingFailedOrSuccess.fold(
            (l) {
          print("SettingLoadFailState : $l");
          return SettingLoadFailState();
        },
            (r) {
          print("SettingLoadSuccessState : $r");
          return SettingLoadSuccessState(setting: r);
        },
      );
    }

    if (event is ChangeAppThemeModeEvent) {
      yield SettingLoadingState();
      final changeAppThemeModeFailedOrSuccess =
      await changeAppThemeMode(Params(appThemeMode: event.appThemeMode));
      yield changeAppThemeModeFailedOrSuccess.fold(
            (l) {
          return AppThemeModeChangeFailState();
        },
            (r) {
          return AppThemeModeChangeSuccessState();
        },
      );
    }
  }

  @override
  void onTransition(Transition<SettingEvent, SettingState> transition) {
    print("SettingBloc : $transition");
    super.onTransition(transition);
  }
}
