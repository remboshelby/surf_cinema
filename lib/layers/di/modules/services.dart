import 'package:surf_cinema/app/config.dart';
import 'package:surf_cinema/layers/di/modules/services/api.dart';
import 'package:surf_cinema/layers/di/modules/services/domain.dart';

Future<void> setupServicesDependencies(Config config) async {
  await setupApiDependencies(config);
  await setupDomainDependencies(config);
}
