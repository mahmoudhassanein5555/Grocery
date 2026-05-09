// run => dart run build_runner build --delete-conflicting-outputs

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'servicelocator.config.dart';
import 'package:grocery1/core/di/servicelocator.config.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() {
  getIt.registerLazySingleton(() => FlutterSecureStorage());
  getIt.init();
}
