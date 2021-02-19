import 'package:get_it/get_it.dart';

import 'config.dart';

Future<void> setupDependencies(Config config) async {
  final sl = GetIt.instance;

  sl.registerSingleton<Config>(config);
}
