import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class ConfigField<T> {
  final String title;
  final T value;

  ConfigField(this.title, this.value);
}

class Config {
  final String configName;
  final String apiBaseUrl;
  final String apiKey;

  List<ConfigField> get fields => [
        ConfigField('Config name', configName),
        ConfigField('API Endpoint', apiBaseUrl),
        ConfigField('API Key', apiKey),
      ];

  Config({
    @required this.configName,
    @required this.apiBaseUrl,
    @required this.apiKey,
  })  : assert(configName != null),
        assert(apiBaseUrl != null),
        assert(apiKey != null);

  Config copyWith({
    String configName,
    String apiBaseUrl,
    String apiKey,
  }) {
    return Config(
      configName: configName ?? this.configName,
      apiBaseUrl: apiBaseUrl ?? this.apiBaseUrl,
      apiKey: apiKey ?? this.apiKey,
    );
  }
}

class AppConfig extends InheritedWidget {
  final Config config;

  const AppConfig({
    @required this.config,
    @required Widget child,
  })  : assert(config != null),
        super(child: child);

  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
