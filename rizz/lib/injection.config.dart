// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:rizz/db/services/database_service.dart' as _i3;
import 'package:rizz/services/notifications.dart' as _i4;
import 'package:rizz/services/user_services.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.DatabaseService>(() => _i3.DatabaseService());
    gh.singleton<_i4.NotificationServices>(() => _i4.NotificationServices());
    gh.singleton<_i5.UserServices>(() => _i5.UserServices());
    return this;
  }
}
