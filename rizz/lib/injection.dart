
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:rizz/injection.config.dart';

final getIt=GetIt.instance;

@InjectableInit()
void configureDependancies(){
  getIt.init();
}