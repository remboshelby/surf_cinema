import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:surf_cinema/layers/ui/themes.dart';

Future<void> setUp() async {
  await Hive.initFlutter();

  // Hive.registerAdapter(WalletInformationAdapter());
  // Hive.registerAdapter(TransactionHiveStateAdapter());
}

class SurfCinema extends StatelessWidget {
  final _navigator = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigator,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ru'),
      ],
      theme: AppThemes.materialAppTheme(),
      home: Container(),
    );
  }
}
