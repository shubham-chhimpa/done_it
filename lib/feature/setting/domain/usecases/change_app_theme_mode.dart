import 'package:dartz/dartz.dart';
import 'package:done_it/core/error/failures.dart';
import 'package:done_it/core/usecases/usecase.dart';
import 'package:done_it/feature/setting/domain/entities/setting.dart';
import 'package:done_it/feature/setting/domain/repositories/setting_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class ChangeAppThemeMode implements UseCase<void, Params> {
  final SettingRepository settingRepository;

  ChangeAppThemeMode(this.settingRepository);

  @override
  Future<Either<Failure, void>> call(Params params) {
    return settingRepository.changeAppThemeMode(params.appThemeMode);
  }
}

class Params extends Equatable {
  final AppThemeMode appThemeMode;

  Params({@required this.appThemeMode});

  @override
  List<Object> get props => [appThemeMode];
}
