import 'package:get_it/get_it.dart';
import 'package:surf_cinema/layers/di/modules/adapters.dart';
import 'package:surf_cinema/layers/di/modules/services.dart';
import 'package:surf_cinema/layers/services/network/network.dart';

import 'config.dart';

Future<void> setupDependencies(Config config) async {
  final sl = GetIt.instance;

  sl.registerSingleton<Config>(config);

  await setupNetworkDependencies(config);
  await setupServicesDependencies(config);
  await setupAdaptersDependencies();
}
