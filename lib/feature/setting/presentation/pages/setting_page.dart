import 'package:done_it/feature/setting/domain/entities/setting.dart';
import 'package:done_it/feature/setting/presentation/blocs/setting/setting_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatelessWidget {
  static const routeName = '/SettingPage';

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingBloc, SettingState>(
      listener: (BuildContext context, SettingState settingState) {
        if (settingState is AppThemeModeChangeSuccessState) {
          context.read<SettingBloc>().add(LoadSettingEvent());
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Setting")),
        body: BlocBuilder<SettingBloc, SettingState>(
          builder: (BuildContext context, SettingState settingState) {
            if (settingState is SettingLoadSuccessState) {
              return Column(
                children: [
                  ListTile(
                    title: Text("Dark Mode"),
                    trailing: Switch(
                      value: settingState.setting.appThemeMode ==
                          AppThemeMode.dark,
                      onChanged: (value) {
                          context.read<SettingBloc>().add(
                            ChangeAppThemeModeEvent(
                                appThemeMode: value
                                    ? AppThemeMode.dark
                                    : AppThemeMode.light),
                          );
                      },
                    ),
                  )
                ],
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
