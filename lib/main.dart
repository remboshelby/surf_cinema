import 'package:flutter/material.dart';
import 'package:surf_cinema/app/app.dart';
import 'package:surf_cinema/app/config.dart';
import 'package:surf_cinema/app/configs.dart';
import 'package:surf_cinema/app/dependencies.dart';
import 'package:surf_cinema/layers/ui/pages/films_wallet.dart';

Future<void> main() async {
  final config = devConfig();
  final configuredApp = AppConfig(
    config: config,
    child: SurfCinemaApp(
      home: FilmsPageProvider(),
    ),
  );
  await setUp();
  await setupDependencies(config);

  runApp(configuredApp);
}
