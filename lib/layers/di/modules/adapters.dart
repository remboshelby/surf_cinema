import 'package:get_it/get_it.dart';
import 'package:surf_cinema/layers/adapters/films.dart';

Future<void> setupAdaptersDependencies() async {
  final sl = GetIt.instance;

  sl.registerFactory<FilmsAdapter>(
        () => FilmsAdapter(),
  );
}