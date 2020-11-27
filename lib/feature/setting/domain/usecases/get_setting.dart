import 'package:dartz/dartz.dart';
import 'package:done_it/core/error/failures.dart';
import 'package:done_it/core/usecases/usecase.dart';
import 'package:done_it/feature/setting/domain/entities/setting.dart';
import 'package:done_it/feature/setting/domain/repositories/setting_repository.dart';

class GetSetting implements UseCase<Setting, NoParams> {
  final SettingRepository settingRepository;

  GetSetting(this.settingRepository);

  @override
  Future<Either<Failure, Setting>> call(NoParams noParams) async {
    return await settingRepository.getSetting();
  }
}
