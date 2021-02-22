import 'package:get_it/get_it.dart';
import 'package:surf_cinema/app/config.dart';
import 'package:surf_cinema/layers/di/modules/services/api.dart';
import 'package:surf_cinema/layers/di/modules/services/domain.dart';

Future<void> setupServicesDependencies(Config config) async{
  final sl = GetIt.instance;

  await setupApiDependencies(config);
  await setupDomainDependencies(config);
}