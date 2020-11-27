import 'package:dartz/dartz.dart';
import 'package:done_it/core/error/exceptions.dart';
import 'package:done_it/core/error/failures.dart';
import 'package:done_it/feature/setting/data/datasources/setting_local_data_source.dart';
import 'package:done_it/feature/setting/domain/entities/setting.dart';
import 'package:done_it/feature/setting/domain/repositories/setting_repository.dart';
import 'package:flutter/material.dart';

class SettingRepositoryImpl implements SettingRepository {
  final SettingLocalDataSource settingLocalDataSource;

  SettingRepositoryImpl({@required this.settingLocalDataSource});

  @override
  Future<Either<Failure, Setting>> getSetting() async {
    try {
      return Right(await settingLocalDataSource.getSetting());
    } on DataBaseException {
      return Left(DataBaseFailure());
    }
  }

  @override
  Future<Either<Failure, void>> changeAppThemeMode(AppThemeMode appThemeMode) async {
    try {
      return Right(await settingLocalDataSource.changeAppThemeMode(appThemeMode));
    } on DataBaseException {
    return Left(DataBaseFailure());
    }
  }
}
