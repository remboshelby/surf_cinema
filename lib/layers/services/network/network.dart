import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:surf_cinema/app/config.dart';
import 'package:surf_cinema/layers/api/dio_client.dart';

Future<void> setupNetworkDependencies(Config config) async {
  final sl = GetIt.instance;

  sl.registerFactory<Dio>(
    () => Dio(),
  );

  sl.registerFactory<DioClient>(
    () => DioClient(
      GetIt.instance.get<Dio>(),
      baseEndpoint: config.apiBaseUrl,
    ),
  );
}
