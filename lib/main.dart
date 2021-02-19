import 'package:flutter/material.dart';
import 'package:surf_cinema/app/app.dart';
import 'package:surf_cinema/app/config.dart';
import 'package:surf_cinema/app/configs.dart';
import 'package:surf_cinema/app/dependencies.dart';

Future<void> main() async {
  final config = devConfig();
  final configuredApp = AppConfig(
    config: config,
    child: SurfCinema(),
  );
  runApp(configuredApp);

  await setUp();
  await setupDependencies(config);
}
